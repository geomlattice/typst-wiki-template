import subprocess
import cherrypy
import cherrypy_cors
from marshmallow import Schema, fields
import json
from cherrypy.process import plugins

#TODO: replace with khal results from subprocess
sample_data = [
        "event 1",
        "event 2",
]

class EventSchema(Schema):
    name = fields.String(required=True)

def main():
    #print("Hello from cherrytyp!")
    test_subproc = subprocess.run(["ls"], capture_output=True)
    print(test_subproc.stdout.decode('utf-8'))

class KhalController:
    @cherrypy.tools.json_out()
    def get_all(self):
        return [{'name': name} for name in sample_data]
    
    @cherrypy.tools.json_out()
    def get(self, name):
        """
        Handler for /events/<name> (GET)
        """

        if name not in sample_data:
            #TODO: test different string quote techniques
            raise cherrypy.HTTPError(404, f'Event \"{name}\" not found')
        #Identity transform for now
        return [{'name': name}]
   
    @cherrypy.tools.json_in()
    @cherrypy.tools.json_out()
    def add_event(self):
        """
        Handler for /events (POST)
        """

        request_data = cherrypy.request.json

        try:
            data, errors = EventSchema().load(request_data)
        except ValueError:
            data = EventSchema().load(request_data)
            errors = None

        if errors:
            print("error detected")
            errmsg = ', '.join([f'Key: [{key}], Error: {error}' for key, error in errors.items()])
            raise cherrypy.HTTPError(400, f'Malformed POST request data: {errmsg}')
        return f"TODO: add event [{data['name']}]"

def jsonify_error(status, message, traceback, version):
    cherrypy.response.headers['Content-Type'] = 'application/json'
    response_body = json.dumps(
            {
                'error': {
                    'http_status': status,
                    'message': message,
                    }
            })
    cherrypy.response.status = status
    return response_body


if __name__ == "__main__":
    cherrypy_cors.install()
    dispatcher = cherrypy.dispatch.RoutesDispatcher()

    # /events (GET)
    dispatcher.connect(name='events',
                       route='/events',
                       action='get_all',
                       controller=KhalController(),
                       conditions={'method': ['GET']})

    # /events/{name} (GET)
    dispatcher.connect(name='events',
                       route='/events/{name}',
                       action='get',
                       controller=KhalController(),
                       conditions={'method': ['GET']})

    # /events/{name} (POST)
    dispatcher.connect(name='events',
                       route='/events',
                       action='add_event',
                       controller=KhalController(),
                       conditions={'method': ['POST']})

    config = {
            '/': {
                'request.dispatch': dispatcher,
                'error_page.default': jsonify_error,
                'cors.expose.on': True
        },
    }

    cherrypy.tree.mount(root=None, config=config)
    cherrypy.config.update({
        'server.socket_host': '0.0.0.0',
        'server.socket_port': 3333
    })

    cherrypy.engine.start()
    cherrypy.engine.block()
