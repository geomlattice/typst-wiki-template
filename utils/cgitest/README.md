# utils/cgitest

This subdir exists to test cgi functionality 

## login screens

So far there are 3 login screens. 

The file `login_screen.html` is a barebones hand composed html file that triggers the `login.sh` file in `cgi-bin` 

The file `typlogin.html` is modelled after `login_screen.html` demonstrates using the typst compiler to generate html which can trigger the `login.sh` file in `cgi-bin`

The file `puretyplogin.html` demonstrates typst generated html which can be styled with [`Pure.CSS`](https://pure-css.github.io/)

To test

```bash
make serve #in tmux window or something
$BROWSER "http://localhost:2221/login_screen.html" 
$BROWSER "http://localhost:2221/typlogin.html" 
$BROWSER "http://localhost:2221/puretyplogin.html" 

#or in more abstract terms
TYPWEB_HOSTNAME=localhost
TYPWEB_PORT=2221
BROWSER=qutebrowser
LOGIN_SCREEN=puretyplogin.html

"$BROWSER" "http://$TYPWEB_HOSTNAME:$TYPWEB_PORT/$LOGIN_SCREEN"
```

## cgi-bin

### Login

The file `cgi-bin/login.sh` uses [`bcrypt-tool`](https://github.com/shoenig/bcrypt-tool) and standard UNIX command line tools for shell scripting to handle user login and invoke processes to generate output html upon success or failure

### Typstfib

The file `cgi-bin/typst_fib.sh` uses [`pdfgrep`](https://gitlab.com/pdfgrep/pdfgrep) to extract text output from tyspt pdfs.

To test

```bash
bash cgiutils/tests/typ_fib.sh
```

### Khalsearch

The file `cgi-bin/khal_search.sh` has been written before the UI flow etc for it. It is intended to show how shell commands can be fed over cgi-bin into typst to generate modern feeling web frontends.
