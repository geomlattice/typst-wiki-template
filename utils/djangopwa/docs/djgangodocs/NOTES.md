# utils/djangopwa/docs/djgangodocs 

Reading Notes from the Django Docs served from disk on localhost in a docker container.

## Intro

### Django at a glance

- Note: Models are defined in `$APP/models.py` 
- Questions: Since database schemas are defined in python via classes and since SQL admits domain relational calculus [CITE](https://en.wikipedia.org/CITE) set theory is heavily involved. How does one consider the classes from the vantage point of set theory? Assuming a constructive approach, something of a monadic comprehension [CITE](https://en.wikipedia.org/CITE), how does one frame a class?  
- Note: Register models in `$APP/admin.py`

> The philosophy here is that your site is edited by a staff, or a client, or maybe just you – and you don’t want to have to deal with creating backend interfaces only to manage content.

> One typical workflow in creating Django apps is to create models and get the admin sites up and running as fast as possible, so your staff (or clients) can start populating data. Then, develop the way data is presented to the public.

- Note: Navigation and Routing is handled by `urlCONF` `urlpatterns` which is `$APP/urls.py`

> Each view is responsible for doing one of two things: Returning an HttpResponse object containing the content for the requested page, or raising an exception such as Http404. The rest is up to you. 

> Generally, a view retrieves data according to the parameters, loads a template and renders the template with the retrieved data.

>  Django uses the concept of “template inheritance”. That’s what the {% extends "base.html" %} does. It means “First load the template called ‘base’, which has defined a bunch of blocks, and fill the blocks with the following blocks.” In short, that lets you dramatically cut down on redundancy in templates: each template has to define only what’s unique to that template.

### Writing your first Django App Part 1

> What’s the difference between a project and an app? An app is a web application that does something – e.g., a blog system, a database of public records or a small poll app. A project is a collection of configuration and apps for a particular website. A project can contain multiple apps

### Writing your first Django App Part 2

> By default, the DATABASES configuration uses SQLite. If you’re new to databases, or you’re just interested in trying Django, this is the easiest choice. SQLite is included in Python, so you won’t need to install anything else to support your database. When starting your first real project, however, you may want to use a more scalable database like PostgreSQL, to avoid database-switching headaches down the road.

> By default, INSTALLED_APPS contains the following apps, all of which come with Django:

* django.contrib.admin – The admin site. You’ll use it shortly.
* django.contrib.auth – An authentication system.
* django.contrib.contenttypes – A framework for content types.
* django.contrib.sessions – A session framework.
* django.contrib.messages – A messaging framework.
* django.contrib.staticfiles – A framework for managing static files.

Regarding Data Models

> A model is the single, definitive source of information about your data. It contains the essential fields and behaviors of the data you’re storing. Django follows the DRY Principle. The goal is to define your data model in one place and automatically derive things from it.

> Migrations are how Django stores changes to your models (and thus your database schema) - they’re files on disk. You can read the migration for your new model if you like; it’s the file polls/migrations/0001_initial.py. Don’t worry, you’re not expected to read them every time Django makes one, but they’re designed to be human-editable in case you want to manually tweak how Django changes things.

### Writing your first Django App Part 3

> Now we might be able to get away with putting our templates directly in polls/templates (rather than creating another polls subdirectory), but it would actually be a bad idea. Django will choose the first template it finds whose name matches, and if you had a template with the same name in a different application, Django would be unable to distinguish between them. We need to be able to point Django at the right one, and the best way to ensure this is by namespacing them. That is, by putting those templates inside another directory named for the application itself. `polls/templates/polls/index.html`

> Why do we use a helper function get_object_or_404() instead of automatically catching the ObjectDoesNotExist exceptions at a higher level, or having the model API raise Http404 instead of ObjectDoesNotExist? Because that would couple the model layer to the view layer. One of the foremost design goals of Django is to maintain loose coupling.

- Note: namespaces can be added to `$APP/urls.py`

### Writing your first Django App Part 4

> Since we’re creating a POST form (which can have the effect of modifying data), we need to worry about Cross Site Request Forgeries. Thankfully, you don’t have to worry too hard, because Django comes with a helpful system for protecting against it. In short, all POST forms that are targeted at internal URLs should use the `{% csrf_token %}` template tag.

### Writing your first Django App Part 5

> You might have created a brilliant piece of software, but you will find that many other developers will refuse to look at it because it lacks tests; without tests, they won’t trust it. Jacob Kaplan-Moss, one of Django’s original developers, says “Code without tests is broken by design.”

> Some programmers follow a discipline called “test-driven development”; they actually write their tests before they write their code. This might seem counterintuitive, but in fact it’s similar to what most people will often do anyway: they describe a problem, then create some code to solve it. Test-driven development formalizes the problem in a Python test case.

> A conventional place for an application’s tests is in the application’s tests.py file; the testing system will automatically find tests in any file whose name begins with test.

Running tests

```bash
python manage.py test $APP
uv run manage.py test $APP
```

> In effect, we are using the tests to tell a story of admin input and user experience on the site, and checking that at every state and for every new change in the state of the system, the expected results are published.

> For example, while our tests here have covered some of the internal logic of a model and the way our views publish information, you can use an “in-browser” framework such as Selenium to test the way your HTML actually renders in a browser. These tools allow you to check not just the behavior of your Django code, but also, for example, of your JavaScript. It’s quite something to see the tests launch a browser, and start interacting with your site, as if a human being were driving it! Django includes LiveServerTestCase to facilitate integration with tools like Selenium.

> A good way to spot untested parts of your application is to check code coverage. This also helps identify fragile or even dead code. If you can’t test a piece of code, it usually means that code should be refactored or removed. Coverage will help to identify dead code.

### Writing your first Django application part 6

> Aside from the HTML generated by the server, web applications generally need to serve additional files — such as images, JavaScript, or CSS — necessary to render the complete web page. In Django, we refer to these files as “static files”.

> For small projects, this isn’t a big deal, because you can keep the static files somewhere your web server can find it. However, in bigger projects – especially those comprised of multiple apps – dealing with the multiple sets of static files provided by each application starts to get tricky.

> That’s what django.contrib.staticfiles is for: it collects static files from each of your applications (and any other places you specify) into a single location that can easily be served in production.

> create a directory called static in your polls directory. Django will look for static files there, similarly to how Django finds templates inside polls/templates/.

> Just like templates, we might be able to get away with putting our static files directly in polls/static (rather than creating another polls subdirectory), but it would actually be a bad idea. Django will choose the first static file it finds whose name matches, and if you had a static file with the same name in a different application, Django would be unable to distinguish between them. We need to be able to point Django at the right one, and the best way to ensure this is by namespacing them. That is, by putting those static files inside another directory named for the application itself. Put the following code in that stylesheet (polls/static/polls/style.css):


