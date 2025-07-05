#set page(paper: "a5", fill: rgb("#262626"))
#set text(fill: white, font: "DejaVu Sans Mono",  size: 10pt)
#set quote(block: true)
#show link: set text(fill: blue)

#let title = align(center, text(17pt)[ *Stirling Numbers* ])

#grid(
  columns: (auto, 1fr),
  [#pad(y: 10pt, title)],
  grid.hline(stroke: orange)
)

= Stirling Numbers

#quote(attribution: [9781466579897 pg 8 [^1]])[
  The Stirling numbers of the first kind were also discussed by Stirling in 1730. In fact, in roughly the same context #link("../mathematicians/thomas-harriot.pdf")[Thomas Harriot] had come across these numbers already in 1618 in his unpublished manuscript #link("../scholastic/harriot_magisteria_magna-9783037190593.pdf")[Magisteria Magna].
]

== Citation Chain

[^1]: 9781466579897 Commutation Relations, Normal Ordering, and Stirling Numbers https://f005.backblazeb2.com/file/wwwmdf/Commutation_Relations_Normal_Ordering_and_Stirling_Numbers-978-1-4665-7989-7.pdf

