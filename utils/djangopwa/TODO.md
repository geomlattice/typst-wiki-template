# utils/djangopwatest

- [x] generate template
    ```bash
    uv tool install django
    django-admin startproject viewtyp
    cd viewtyp
    uv init
    uv add django
    uv run manage.py collectstatic
    uv run manage.py runserver 0.0.0.0:5554
    ```
- [ ] PWA Functionality and Ease of Use
    - [ ] setup pwa
        * cf `https://github.com/silviolleite/django-pwa`
        ```bash
        uv add django-pwa
        #add `pwa` to `settings.py` INSTALLED_APPS
        #add `STATICFILES_DIRS = [os.path.join(BASE_DIR, 'static'),]` to `settings.py` 
        #add settings template to `settings.py`
        #create thumbnail images with PIL python
        ```
        - [ ] create thumbnail images
            - [ ] review guide video
                * cf `https://youtu.be/lteaqUZWk3E`
                * cf `https://github.com/Yalchin403/youtube/tree/master/projects/pwa_demo`
                * test example code via `$BROWSER http://$IP_ADDR:$PORT/products` 
                - [x] test example code
            - [ ] copy over icons from here `https://github.com/Yalchin403/youtube/tree/master/projects/pwa_demo`
            - [ ] review static files from above
        ```bash
        #add `url('', include('pwa.urls')),` to urlpatterns in `urls.py`  
        #inject {% load pwa %} at top of html
        #inject  {% progressive_web_app_meta %} in html <head>
        ```
            - [ ] generate new icons etc with PIL
            * `/static/images/my_app_icon.png`
            * `static/images/my_apple_icon.png`
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
- [ ] Content
    - [ ] iframe for typ html
        * cf `https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/iframe`
        - [ ] Where do hyperlinks go
- [ ] User Interaction
    - [ ] Write notes to db then typst
