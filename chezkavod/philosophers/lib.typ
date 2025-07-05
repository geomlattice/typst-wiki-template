#let wiki(
	title: none,
	doc,
) = {
  set page(paper: "a5", fill: rgb("#262626"))  
  set text(fill: white, font: "DejaVu Sans Mono",  size: 10pt)
  set quote(block: true)
  show link: set text(fill: blue)
  show math.equation: set text(size: 12pt, font: "DejaVu Math TeX Gyre")
  grid(
	columns: (auto, 1fr),
	[#pad(y: 10pt, text(title, size: 15pt, weight: "bold"))],
	grid.hline(stroke: orange)
  )
  doc
}
