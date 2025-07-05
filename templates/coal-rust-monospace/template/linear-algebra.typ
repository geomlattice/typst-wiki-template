#import "@preview/weike:0.1.0": wiki

#show: wiki.with(
	title:[
		Linear Algebra
	])

== Concept Index

- inner product

=== Inner Product

The inner product of two vectors x, y in K with dimension n is defined to be

$ x dot.op y= sum_(i=1)^n x_i y_i in K $

#quote(attribution: [#link("https://www.google.com/books/edition/Linear_Programming_Duality/OfvuAAAAMAAJ?hl=en")[IBSN 9780387554174]])[
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

1. Bachem, A.., Kern, Walter. Linear Programming Duality: An Introduction to Oriented Matroids. Germany: Springer-Verlag, 1992. IBSN 9780387554174 pg12
