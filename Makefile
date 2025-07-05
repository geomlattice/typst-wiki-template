build:
	bash compile.sh

serve:
	cd dist && python3 -m http.server
