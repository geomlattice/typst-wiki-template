test_typ_fib_raw(){
  curl --silent --header "Content-Type: application/json" \
    --request POST \
    --data '{"fibdata":"7"}' \
    http://localhost:2221/cgi-bin/typst_fib.sh
}

test_typ_fib(){
  HTML_DOCUMENT=$(curl --silent --header "Content-Type: application/json" \
    --request POST \
    --data '{"fibdata":"7"}' \
    http://localhost:2221/cgi-bin/typst_fib.sh)
  echo "$HTML_DOCUMENT" | w3m -dump -T text/html
}

#test_typ_fib_raw
test_typ_fib
