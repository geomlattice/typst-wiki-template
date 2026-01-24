#import "lib.typ": wiki, bquotelink

#show: wiki.with(
	title:[
		Logic
	]
)

=== History 
Logic has a deep history philosophically. The Greeks, Chinese, and Indian Traditions span millennium 

=== Introduction to Computer Science

Today Logic is taught in computer science and applied practically in machine reasoning systems. The transition between logic being a topic of philosophy and something mathematically recognized begins in the thought of Augustus De Morgan. #cite(<demorganwikip>)

De Morgan formalized the rules of Peripatetic Logic as mathematics, but was met with considerable doubt by Sir William Hamilton et al. Boole established a name for himself by defending De Morgan against the slander. It would seem that the Scholastics were privy to the foundations of computer science as much as the British after De Morgan.

#let demorganlink = link("https://en.wikipedia.org/wiki/Augustus_De_Morgan")[Wikipedia: Augustus De Morgan] 

#bquotelink(demorganlink,
  [De Morgan's paper "On the structure of the syllogism", published in 1846, mathematically defines the rules of Aristotelian logic, specifically syllogism, and including what are now known as De Morgan's laws. Historically significant as the inception of mathematical logic, at the time, De Morgan's paper initiated a dispute with Hamilton over the role of mathematics in logic; "mathematics can not conduce to logical habits at all," Hamilton would write. The dispute would focus on the so-called quantification of the predicate, which Hamilton claimed, but as the dispute wore on in the pages of the Athenæum and in the publications of the two writers, it became apparent that Hamilton and his supporters were wrong and that De Morgan's mathematically precise description of Aristotle's logic was correct. On realizing this, Hamilton would claim that De Morgan had committed plagiarism. #cite(<Bell_2014>)

  Boole, a friend of De Morgan's since 1842, motivated in part by the disputes between Whewell and Hamilton and De Morgan and Hamilton, would write The Mathematical Analysis of Logic, published in 1847 on the same day as De Morgan's Formal Logic. Boole's work would eclipse De Morgan's and come to define early mathematical logic. De Morgan continued to support Boole's efforts, proofreading and advocating for Boole's work. Upon Boole's death, De Morgan worked to ensure Boole's family received a government pension. #cite(<Boole_De_Morgan_Smith_1982>) #cite(<Simmons_2011>)
])
//https://doi.org/10.4169/college.math.j.42.1.033
#bibliography("shared.bib")
