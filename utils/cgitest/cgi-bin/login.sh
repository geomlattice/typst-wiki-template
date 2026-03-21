#!/usr/bin/env bash

read -n "$CONTENT_LENGTH" POST_STRING
#form submits as 
#  username=myname&password=123456&Submit=Submit
USER_DATA_FILE="cgiutils/etc/users.txt"
THIS_USERNAME=$(echo "$POST_STRING" | cut -d'&' -f1 | cut -d'=' -f2)
THIS_PASSWORD=$(echo "$POST_STRING" | cut -d'&' -f2 | cut -d'=' -f2)
THIS_USER_LOGIN_DATA=$(cat "$USER_DATA_FILE" | grep "$THIS_USERNAME")

if [[ $THIS_USER_LOGIN_DATA == "" ]]; then 
  echo -e "Content-Type: text/html\n"
  echo -e "<!doctype html><title>Login Failed</title><h2>Login Failed</h2>"
  echo -e "<p>User account does not exist. Register Account?</p>"
  #TODO: add redirect to sign up screen
else
  PASS_DATA=$(cat "$USER_DATA_FILE" | grep "$THIS_USERNAME" | cut -d':' -f2)
  #go install github.com/shoenig/bcrypt-tool@latest
  PASS_TEST=$(bcrypt-tool match $THIS_PASSWORD "$PASS_DATA")
  echo -e "Content-Type: text/html\n"
  echo -e "<!doctype html><title>Login Results</title><h2>Login Status</h2><p>Has $THIS_USERNAME logged in $PASS_TEST</p>"
fi
