#set quote(block: true)
#show link: set text(fill: blue)
#set text(fill: white, font: "DejaVu Sans Mono",  size: 10pt)

#let title = align(center, text(17pt)[ *Typst Wiki Template*])
#grid(
  columns: (auto, 1fr),
  [#pad(y: 10pt, title)],
  grid.hline(stroke: orange)
)

#show link: set text(fill: blue)

Soon, a Search Engine will be implemented over the text files before compilation to pdf with linkage to relevant pdf files. Maybe webassembly can be used to this end? For now however, please refer to the index or use direct links.

== Mathematicians
- #link("mathematicians/thomas-harriot.pdf")[Thomas Harriot]
	=== Scholastic Reductions
	- #link("scholastic/harriot_magisteria_magna-9783037190593.pdf")[Magisteria Magna]
	=== Topics
	- #link("topics/stirling-numbers.pdf")[Stirling Numbers]

== Philosophers
- #link("philosophers/nicomachus-of-gerasa.pdf")[Nicomachus of Gerasa]

== General Topics
- #link("topics/linear-algebra.pdf")[Linear Algebra]
