# Typst Wiki Template PDF Server 

### Local Build Guide

If you need rust
```bash
make install_rust
#curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs  | sh -s -- -y
#. "$HOME/.cargo/env"
```

If you need typst-cli and simple-http-server for local build testing:
```bash
make install
#cargo install --locked typst-cli	
#cargo install simple-http-server
```

After you've made edits in `src/*` that make sense, to view locally
```bash
make build && make serve
#bash compile.sh
#simple-http-server -p 8000 dist/
```
See the Appendix for more information of compilation, serving, and production hosting

### Editor Only Workflow

It is possible to only edit the files in `src/*` and rely on the build done in `~/.github/workflows/jekyll-gh-pages.yml` for ones repo to view the changes, if one does not have access to a development environment or cares not for such tools.

### Project Outline and Wiktionary Etymology

`Wiktionary is the source of most of this information.`

Weike `維客` is Chinese for wiki in the sense as it is used in English. `維` means to preserve; to maintain; to hold together; and dimension while `客` means customer; visitor; and guest. This is related ultimately to the word weiji `維基`, which is derived from Hawaiian wikiwiki, further with this being derivative of Proto-Eastern Polynesian witi which itself means fast, rapid, alert. Exactly this connocation of speed is where English was inspired to call an encyclopedia WikiWikiWeb: the web at its fastest. In the Great Tradition of the Citation Chain, we preserve that which allows us to accomplish ultimate speed. This is the great promise of the future we may bring to the codex and a Neo-Memex.  

This weike template is designed for linking pages together. Another project is under way called wenben `本文` which allows this template to easily be deployed as a wiki of linked pdfs from a github page. This anagram decomposes into `文` as language; culture; writing; formal; literary; gentle along with `本` as roots or stems of plants; origin; source; this; the current; root; foundation; basis; (a measure word). With great speed we accumulate culture as a foundation: the origin of our thinking renegotiating the world. With regards to technical details, the compilaiton is mostly handled by a bash script that a jekyll site deployment runs, as well as the typst-cli rust compiler. The index page utilzes the single bundle browser implementation to render an svg so that foramtting from lib.typ could be hardcoded in index.typ for index.html. This was derived from a modification of the code previewer and exporter offered as an example in typst.ts. Later containerization and so on will be introduced.

A third project is planned, though it remains yet to be started: a citation engine which can index and query the wenben built from weikes. This citation engine would be built into a forum app that also brings microblogging into focus. Luntan `論壇` is the Chinese word for forum. Yet another anagram decomposition yeilds for us `論` as to talk (about); to discuss; theory; by the; per; the Analects (of Confucius), and `壇` is altar. With all these particles, a wave comes about. Suiji `隨機` is chinese for Stochastic, which is the realm we enter with sufficient data. `隨` means to follow; to comply with; to allow; surname while `機` signifies machine; opportunity; secret. The citation engine forum will be a stochastic altar, therefore perphas it should be dubbed as Suiji Luntan. `隨機 論壇`	

A5 paper size has been chosen as to make viewing from a phone or tablet work well. Also, viewer may find that they do not have to full-screen a browser with pdf view, or also from a pdf viewer that has loaded from the url or is those enjoying offline viewing after downloading. With time, a terminal viewing component from the raw .typ files hosted under /src of the root directory of the server hosting wenben `本文`. Naturally, this will be called zhongduan `終端` which means computer terminal, likely a VT100 Emulator. `終` signifies finish or end; `端` end; extremity; item; port; to hold sth. level with both hands; to carry; regular. The idea of a terminal port works well, as one could simply stream `src/**/*.typ` files to such a terminal. The troff document typsetting toolset had nroff for terminal rendering, as far as I am aware, though I am surely a bit lost with regards to such concerns, ever exploring and learning. To carry forward a nroff of typst for a terminal port would lead to ultimate mininalism and thus the greatest speed: weikie wikikiweb; weike weiji wenben `維客 維基 本文` 

### Appendix: GitHub Page Deployment

The structure for this is largely taken from shiroa gh page yml but stripped down to fit my simple compiler for loop control structure. This workflow accomplishes

1. Copies index.html and index.typ into `./dist`
2. Builds typ into pdfs for directory structure in `./dist`
3. Uploads typ source files under `./dist/src`
4. Moves `./dist` to the deployment machine as the root directory

The `./dist` directory is in `.gitignore` because there is no reason to keep track of the compiled pdfs. `./dist` is populated on localhost only for preivew purposes and is not source controlled. This compilation happens on both localhost during preview testing the the github continuous integration. With time, containerization will be offered, as well as a database layer inspired by wikimedia.

```bash
#ensure compilation target directories exist
mkdir -p dist/philosophers
mkdir -p dist/mathematicians
mkdir -p dist/topics
mkdir -p dist/scholastic

#move into src and iterate over all typ source
cd src
COMPILE_TARGETS=$(find . -name "*.typ") 

#control flow:
#1. Handle Index Special Case: copy files for later processing on deployment
#2. Handle lib.typ Special Case: report no action needed
#3. Compile all flowthrough expecting hierachy with depth of 2 where dir and filename occupy these two dimensions in order

#NOTE: direct compilation of typst to html lacks math rendering and is generally a work in progress

for i in $COMPILE_TARGETS; do 
	#echo name of file so errors can easily be linked to files
	echo $i
	if [ $i == "./index.typ" ]; then 
		#typst compile --features html --format html $i "../dist/index.html"
    		cp "./index.html" "../dist" && cp $i "../dist"
    		echo "index is compiled later via html embedded javascript"
	elif [ $i == "./lib.typ" ]; then
		echo "lib.typ should not be directly compiled"	
	elif [ $(echo $i | cut -d '/' -f 3) == "lib.typ" ]; then
		echo "subdir level lib.typ should not be directly compiled"
	else
		#../concept/entry.typ -> concept
		DIR=$(echo $i | cut -d '/' -f 2)
		#../concept/entry.typ -> entry.typ -> entry
		FILE=$(echo $i |cut -d '/' -f 3 | cut -d '.' -f 1)
		PDF_FILEPATH="../dist/$DIR/$FILE.pdf"
		echo $PDF_FILEPATH; 
		typst compile $i $PDF_FILEPATH
	fi
done
```

The yml is rather simple since the complexity is largely left to `compile.sh`

```yml
on:
  # Runs on pushes targeting the default branch
  push:
    branches: ['main']

  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:

# Sets permissions of the GITHUB_TOKEN to allow deployment to GitHub Pages
permissions:
  pages: write
  id-token: write
  contents: read

# Allow only one concurrent deployment, skipping runs queued between the run in-progress and latest queued.
# However, do NOT cancel in-progress runs as we want to allow these production deployments to complete.
concurrency:
  group: 'pages'
  cancel-in-progress: false

jobs:
  build-gh-pages:
    runs-on: ubuntu-latest
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    steps:
      - name: Checkout
        uses: actions/checkout@v4
        with:
          submodules: recursive
      - name: Install Rust
        uses: dtolnay/rust-toolchain@stable
      - name: Set Node.js 22.x
        uses: actions/setup-node@v3
        with:
          node-version: 22.x
      - name: Install Artifact Cache
        uses: Swatinem/rust-cache@v2
      - name: Install Typst
        run: |
          cargo install --locked typst-cli
      - name: Build Book
        run: |
          bash compile.sh
      - name: Upload Typst Source Code
        run: |
          mkdir -p ./dist/src
          cp -r src/* ./dist/src
      - name: Setup Pages
        uses: actions/configure-pages@v5
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: './dist'
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```
