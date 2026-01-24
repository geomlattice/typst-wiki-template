# Design

### Citations
* wikipedia citations must be moved directly into bibliography and cited within typst

### Styling
* tailwindcss standalone (no nodejs)
* tailwindcss in `lib.typ` files
* tailwindcss should never be in wiki file directly
    * only imported functions should expose tailwindcss to wiki
* tailwindcss also in `test_styles.css`
    * whole document level `@apply` goes here

### Links

* wikis are hyperlinked together expecting a set filestructure
    * original hyperlink testing linked pdfs together
    * current hyperlink testing links html pages together

* deeper sources in scholastic reduction are linked to backblaze bucket (can be s3)
    * at present recursion is not implemented but a subset of a breadth first search is implied by careful scholarship

* wikipedia links must be named the exact string that will allow a url to retrieve the page


### Math

* Math blocks in pdf seem to work inline
* Math blocks in html currently do not display inline
* Math font not found in container 



