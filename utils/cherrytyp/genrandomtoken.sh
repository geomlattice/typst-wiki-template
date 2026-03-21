OPENSSL_DGST="-sha512"
RANDNUM=$RANDOM
echo "$RANDNUM" | openssl dgst "$OPENSSL_DGST" | awk '{print $2}'
