getdocs:
	mkdir zim
	wget -O zim/djangodocs.zim https://download.kiwix.org/zim/devdocs/devdocs_en_django_2026-01.zim

serve:
	docker run -v ./zim:/data -p 3336:8080 ghcr.io/kiwix/kiwix-serve djangodocs.zim

