#import "lib.typ": wiki, bquotelink, wikiheading

#show: wiki.with(
	title:[
		Logic
	]
)

#wikiheading("History") 

Logic has a deep history philosophically. The Greeks, Chinese, and Indian Traditions span millennium 

#wikiheading("Introduction to Computer Science")

Today Logic is taught in computer science and applied practically in machine reasoning systems. The transition between logic being a topic of philosophy and something mathematically recognized begins in the thought of Augustus De Morgan. #cite(<demorganwikip>)

De Morgan formalized the rules of Peripatetic Logic as mathematics, but was met with considerable doubt by Sir William Hamilton et al. Boole established a name for himself by defending De Morgan against the slander. It would seem that the Scholastics were privy to the foundations of computer science as much as the British after De Morgan.

#let demorganlink = link("https://en.wikipedia.org/wiki/Augustus_De_Morgan")[Wikipedia: Augustus De Morgan] 

#bquotelink(demorganlink,
  [De Morgan's paper "On the structure of the syllogism", published in 1846, mathematically defines the rules of Aristotelian logic, specifically syllogism, and including what are now known as De Morgan's laws. Historically significant as the inception of mathematical logic, at the time, De Morgan's paper initiated a dispute with Hamilton over the role of mathematics in logic; "mathematics can not conduce to logical habits at all," Hamilton would write. The dispute would focus on the so-called quantification of the predicate, which Hamilton claimed, but as the dispute wore on in the pages of the Athenæum and in the publications of the two writers, it became apparent that Hamilton and his supporters were wrong and that De Morgan's mathematically precise description of Aristotle's logic was correct. On realizing this, Hamilton would claim that De Morgan had committed plagiarism. #cite(<Bell_2014>)

  Boole, a friend of De Morgan's since 1842, motivated in part by the disputes between Whewell and Hamilton and De Morgan and Hamilton, would write The Mathematical Analysis of Logic, published in 1847 on the same day as De Morgan's Formal Logic. Boole's work would eclipse De Morgan's and come to define early mathematical logic. De Morgan continued to support Boole's efforts, proofreading and advocating for Boole's work. Upon Boole's death, De Morgan worked to ensure Boole's family received a government pension. #cite(<Boole_De_Morgan_Smith_1982>) #cite(<Simmons_2011>)
])

#wikiheading("Mature Formulation in Computer Science")

One of the more consequential results in theoretical computer science is the Büchi–Elgot–Trakhtenbrot theorem which makes use of monadic second order logic #cite(<buchielgotwikip>). This elevates logic to the consideration over sets, with a focus on the edges and verticies of graphs being especially fruitful in the design and analysis of algorithms. Further, this theorem solidly bridges computational grammar and higher order logic.

#let buchielgottraklink = link("https://en.wikipedia.org/wiki/B%C3%BCchi%E2%80%93Elgot%E2%80%93Trakhtenbrot_theorem")[Wikipedia: Büchi–Elgot–Trakhtenbrot theorem]

#bquotelink(buchielgottraklink,
[In formal language theory, the Büchi–Elgot–Trakhtenbrot theorem states that a language is regular if and only if it can be defined in monadic second-order logic (MSO): for every MSO formula, we can find a finite-state automaton defining the same language, and for every finite-state automaton, we can find an MSO formula defining the same language. The theorem is due to Julius Richard Büchi #cite(<Buchi_1960>), Calvin Elgot #cite(<Elgot_1961>), and Boris Trakhtenbrot #cite(<Trakhtenbrot_1966>).
])

#bibliography("shared.bib")
