install_rust:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs  | sh -s -- -y
	. "$HOME/.cargo/env"

install:
	cargo install --locked typst-cli	
	cargo install simple-http-server

build:
	bash compile.sh

serve:
	simple-http-server -p 8000 dist/

upload:
	git add src/*
	git commit -m $(msg)
	git push
