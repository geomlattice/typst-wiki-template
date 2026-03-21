#!/usr/bin/env bash

read -n "$CONTENT_LENGTH" POST_STRING
TYPST_INPUT=$(echo "$POST_STRING" | jq -r '.fibdata')
typst compile "cgiutils/typ-bin/fib.typ" --input FIB_DATA="$TYPST_INPUT" "cgiutils/typ-bin/out/fib.pdf"
TYPST_OUTPUT=$(pdfgrep '.' "cgiutils/typ-bin/out/fib.pdf" | xargs echo | col -b)

echo -e "Content-Type: text/html\n"
echo -e "<!doctype html><title>Typst Fib</title><h2> FIB of $TYPST_INPUT is $TYPST_OUTPUT</h2>"
