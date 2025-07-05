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

$ x^y= sum_{i=1}^{n} x_{i}y_{i} in K $

Two vectors x,y $in$ $K^n$ are said to be orthogonal, denoted by x $perp$ y if their inner product equals zero [1](https://f005.backblazeb2.com/file/wwwmdf/Linear_Programing-9780387554174.pdf). 

== Citation Chain

1. pp12 https://f005.backblazeb2.com/file/wwwmdf/Linear_Programing-9780387554174.pdf
