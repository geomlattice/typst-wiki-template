import requests
r = requests.get('https://raw.githubusercontent.com/geomlattice/typst-wiki-template/refs/heads/main/TODO.md')
print("Hello, world!")
print(r.text)


