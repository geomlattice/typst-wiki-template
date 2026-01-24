FROM rust:trixie

RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates
RUN cargo install --locked typst-cli	
RUN cargo install simple-http-server
RUN wget -O /usr/local/bin/tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/download/v4.1.18/tailwindcss-linux-x64
RUN chmod +x /usr/local/bin/tailwindcss

RUN mkdir -p /var/www/dist
ADD compile.sh /var/www/
ADD compile-html.sh /var/www/

CMD	["simple-http-server", "-p", "8000", "/var/www/dist/"]
