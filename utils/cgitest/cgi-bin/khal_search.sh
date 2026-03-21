#!/usr/bin/env bash

read -n "$CONTENT_LENGTH" POST_STRING
SEARCH_QUERY=$(echo "$POST_STRING" | jq -r '.search')
#TODO: generate this config file
SEARCH_RESULTS=$(khal -c cgiutils/config/khalconfig search "$SEARCH_QUERY")
echo -e "Content-Type: text/html\n"
echo -e "<!doctype html><title>Typst Fib</title><h2>Search Results</h2><p>$SEARCH_RESULTS</p>"
