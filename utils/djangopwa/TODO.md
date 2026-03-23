# utils/djangopwatest

- [x] Read Django Docs
    * cf `https://browse.library.kiwix.org/viewer#devdocs_en_django_2026-01/index`
    - [ ] Guide: How-tos
    - [x] Guide: Intro
    - [x] API
- [x] generate template
    ```bash
    uv tool install django
    django-admin startproject viewtyp
    cd viewtyp
    uv init
    uv add django
    uv run manage.py startapp cards
    #add "cards" to INSTALLED_APPS in `viewtyp/settings.py`
    uv run manage.py collectstatic
    uv run manage.py migrate
    uv run manage.py runserver 0.0.0.0:5554
    ```

- [ ] PWA Functionality and Ease of Use
    - [x] setup pwa
        * cf `https://github.com/silviolleite/django-pwa`
        ```bash
        uv add django-pwa
        #add `pwa` to `settings.py` INSTALLED_APPS
        #add `STATICFILES_DIRS = [os.path.join(BASE_DIR, 'static'),]` to `settings.py` 
        #add settings template to `settings.py`
        #create thumbnail images with PIL python
        ```
        - [ ] create thumbnail images
            - [x] review guide video
                * cf `https://youtu.be/lteaqUZWk3E`
                * cf `https://github.com/Yalchin403/youtube/tree/master/projects/pwa_demo`
                * test example code via `$BROWSER http://$IP_ADDR:$PORT/products` 
                - [x] test example code
            - [x] copy over icons from here `https://github.com/Yalchin403/youtube/tree/master/projects/pwa_demo`
            - [x] review static files from above
            - [x] review django framework `https://youtu.be/nGIg40xs9e4`
            - [x] get `serviceworker.js` to serve
            - [x] get `manifest.json` to serve
        ```bash
        #add `url('', include('pwa.urls')),` to urlpatterns in `urls.py`  
        #inject {% load pwa %} at top of html
        #inject  {% progressive_web_app_meta %} in html <head>
        ```
            - [ ] generate new icons etc with imagemagick
            - [ ] `160x160`
            * `/images/icons/icon-${VALUE}.png`
            - [ ] `72x72`
            - [ ] `96x96`
            - [ ] `128x128`
            - [ ] `152x152`
            - [ ] `192x192`
            - [ ] `384x384`
            - [ ] `512x512`
            * `/static/images/icons/splash-${VALUE}.png`
            - [ ] `640x1136`
            - [ ] `750x1334`
            - [ ] `1242x2208`
            - [ ] `1125x2436`
            - [ ] `828x1792`
            - [ ] `1242x2688`
            - [ ] `1536x2048`
            - [ ] `1668x2224`
            - [ ] `1668x2388`
            - [ ] `2048x2732`

    - [ ] pwa install button gallery
        * cf `https://developer.mozilla.org/en-US/docs/Web/Progressive_web_apps/How_to/Trigger_install_prompt`
    - [ ] Explore PWABuilder for iOS and Android App stores
        * cf `https://www.pwabuilder.com/`
    - [ ] TLS/SSL for non-localhost install of pwa
        * `tmole https` works
        * try `caddy`

- [ ] Processes in Viewmodel
    * review `https://joshkaramuth.com/blog/django-view-model/`
    - [x] create new data models
        * `uv run manage.py makemigrations cards`
        * `uv run manage.py migrate`
    - [x] setup viewmodel
    - [x] create pages
        - [x] empty template with no params passed in
        - [x] dump raw json into template
        - [ ] create list and iterate in template
            * example code: `djangodocs/intro/tutorial03`
            * for `polls/templates/polls/index.html`
            ```html
            {% if latest_question_list %}
                <ul>
                {% for question in latest_question_list %}
                    <li><a href="/polls/{{ question.id }}/">{{ question.question_text }}</a></li>
                {% endfor %}
                </ul>
            {% else %}
                <p>No polls are available.</p>
            {% endif %}
            ```
            * for `polls/views.py` 
            ```python
            from django.http import HttpResponse
            from django.template import loader
            from .models import Question

            def index(request):
                latest_question_list = Question.objects.order_by("-pub_date")[:5]
                template = loader.get_template("polls/index.html")
                context = {"latest_question_list": latest_question_list}
                return HttpResponse(template.render(context, request))
            ```
            * attempt:
            ```html
            {% if view_model.indexlist %}
            <ul>
              {% for wikiarticle in view_model.indexlist %}
                <li> {{ wikiarticle.loc }}</li>
              {% endfor %}
            </ul>
            {% endif %}
            ```
        - [x] hyperlinks as direct page

    - [ ] build index for homepage
        - [x] request `sitemap.xml` then convert to json
            - [x] draft request (viewmodel<-model)
                * `$PWA_PREFIX/cards/view_models.py`
            - [x] convert xml to json (viewmodel)
            - [x] return json xml (viewmodel->view)
            - [x] display raw json (view)
            - [x] alter html template for wiki article
                - [ ] style etc
            - [x] move json parsing to viewmodel
                - [ ] generate models with json entries 
    - [ ] feed data into pages
    - [x] redirect to typst article wiki page

    - [ ] redirect to djangopwa article wiki page
        - [ ] Content in View
            - [ ] iframe for typ html
                * cf `https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/iframe`

- [ ] User Interaction
    - [ ] Write notes to db then typst

- [x] Qutebrowser test
    * cf `https://github.com/qutebrowser/qutebrowser/issues/8288#issuecomment-2310682936`

- [ ] Setup logs
    * cf `https://stackoverflow.com/questions/3182298/where-do-things-go-when-i-print-them-from-my-django-app`
