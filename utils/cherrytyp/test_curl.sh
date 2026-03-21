CHERRY_HOSTNAME=localhost
CHERRY_PORT=3333

test_nodes(){
	curl --verbose "http://$CHERRY_HOSTNAME:$CHERRY_PORT/events"
}

test_error(){
	curl --verbose --user user:password "http://$CHERRY_HOSTNAME:$CHERRY_PORT/events/notfound"
}

test_post(){
	curl --verbose --user user:password \
--header "Content-Type: application/json" \
--data "{\"name\": \"blah\"}" "http://$CHERRY_HOSTNAME:$CHERRY_PORT/events"
}


#test_nodes
#test_error
test_post
