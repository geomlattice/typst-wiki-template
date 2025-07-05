#set page(paper: "a5", fill: rgb("#262626"))
#set text(fill: white, font: "DejaVu Sans",  size: 10pt)
#set quote(block: true)
#show link: set text(fill: blue)
#show math.equation: set text(size: 12pt, font: "DejaVu Math TeX Gyre")

#let title = align(center, text(10pt)[ *Linear Algebra* ])

#grid(
  columns: (auto, 1fr),
  [#pad(y: 10pt, title)],
  grid.hline(stroke: orange)
)

== Concept Index

- inner product

=== Inner Product

The inner product of two vectors x, y in K with dimension n is defined to be

$ x dot.op y= sum_(i=1)^n x_i y_i in K $

#quote(attribution: [#link("https://f005.backblazeb2.com/file/wwwmdf/Linear_Programing-9780387554174.pdf#page=14")[IBSN 9780387554174]])[
  Two vectors x,y $in$ $K^n$ are said to be orthogonal, denoted by x $perp$ y if their inner product equals zero  
]

```typst
	#let inner(a, b) = {
	  if a.len() != b.len() {
	    fail("Arrays must be the same length")
	  }

	  a.zip(b).fold(0, (acc, pair) => {
	    let (x, y) = pair
	    acc + x * y
	  })
	}

	#let x = (1, 2, 3)
	#let y = (4, 5, 6)

	Inner product: #inner(x, y)
```


#let inner(a, b) = {
  if a.len() != b.len() {
    fail("Arrays must be the same length")
  }

  a.zip(b).fold(0, (acc, pair) => {
    let (x, y) = pair
    acc + x * y
  })
}

#let x = (1, 2, 3)
#let y = (4, 5, 6)

Inner product: #inner(x, y)

== Citation Chain

1. pp12 https://f005.backblazeb2.com/file/wwwmdf/Linear_Programing-9780387554174.pdf
