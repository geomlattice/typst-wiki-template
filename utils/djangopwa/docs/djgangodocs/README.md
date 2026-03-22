# utils/djangopwa/docs/djgangodocs 

In order to read the djangodocs offline through a localhost server, [kiwix-tools](https://github.com/kiwix/kiwix-tools) is available with the [Kiwix Docker Guide](https://github.com/kiwix/kiwix-tools/tree/main/docker) and [Kiwix Server Docker Guide](https://github.com/kiwix/kiwix-tools/tree/main/docker/server)

For scripts and alternative frontends, see [Kiwix Serve API](https://kiwix-tools.readthedocs.io/en/latest/kiwix-serve.html#http-api)

The compose file will use volumes so ensure that `./zim` has the files desired. For Django Docs:

```bash
mkdir zim
wget -O zim/djangodocs.zim https://download.kiwix.org/zim/devdocs/devdocs_en_django_2026-01.zim
docker run -v ./zim:/data -p 3336:8080 ghcr.io/kiwix/kiwix-serve djangodocs.zim
```

The Makefile offers the above as shortcuts as well.
