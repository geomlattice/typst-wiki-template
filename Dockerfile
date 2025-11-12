FROM rust:trixie

RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates
RUN cargo install --locked typst-cli	
RUN cargo install simple-http-server

RUN mkdir -p /var/www/dist
ADD compile.sh /var/www/

CMD	["simple-http-server", "-p", "8000", "/var/www/dist/"]
