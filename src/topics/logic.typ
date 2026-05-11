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

More is to be said on formal language and dual finite automata. In so far as graphs `G=(V,E)` describe or encode finite state automata, we should admit such math immediately into a theory of linguistics or any gander at semiotics. 

Constructive Set Theory paired with graphs `G=(V,E)` tends towards a very powerful expressive manner of thinking and speaking. Two places to begin with towards utilizing such a calculus of logic are the Universal Quantifier and Existential Quantifier. 

#let universalquantifer = link("https://en.wikipedia.org/w/index.php?title=Universal_quantification&oldid=1349152560")[Wikipedia: Universal quantification]

#bquotelink(universalquantifer, 
[
  In mathematical logic, a universal quantification is a type of quantifier, a logical constant which is interpreted as "given any", "for all", "for every", or "given an arbitrary element". It expresses that a predicate can be satisfied by every member of a domain of discourse. In other words, it is the predication of a property or relation to every member of the domain. It asserts that a predicate within the scope of a universal quantifier is true of every value of a predicate variable.

  It is usually denoted by the turned A (∀) logical operator symbol, which, when used together with a predicate variable, is called a universal quantifier ("∀x", "∀(x)", or sometimes by "(x)" alone). Universal quantification is distinct from existential quantification ("there exists"), which only asserts that the property or relation holds for at least one member of the domain.
])

Regarding the Existential Quantifier:

#let existentialquantifier = link("https://en.wikipedia.org/w/index.php?title=Existential_quantification&oldid=1347481322")[Wikipedia: Existential quantification]

#bquotelink(existentialquantifier, 
[
  In predicate logic, an existential quantification is a type of quantifier which asserts the existence of an object with a given property. It is usually denoted by the logical operator symbol ∃, which, when used together with a predicate variable, is called an existential quantifier ("∃x" or "∃(x)" or "(∃x)"[1]), read as "there exists", "there is at least one", or "for some". Existential quantification is distinct from universal quantification ("for all"), which asserts that the property or relation holds for all members of the domain
])

Using these two concepts one can construct SQL queries which allows for a form of database operation:

#let domainrelationalcalculus = link("https://en.wikipedia.org/w/index.php?title=Domain_relational_calculus&oldid=1317987872")[Wikipedia: Domain Relational Calculus]

#bquotelink(domainrelationalcalculus, 
[
  In computer science, domain relational calculus (DRC) is a calculus that was introduced by Michel Lacroix and Alain Pirotte as a declarative database query language for the relational data model.

  This language uses the same operators as tuple calculus, the logical connectives ∧ (and), ∨ (or) and ¬ (not). The existential quantifier (∃) and the universal quantifier (∀) can be used to bind the variables.
  
  Its computational expressiveness is equivalent to that of relational algebra
  //TODO: show set theory example
])

//TODO: remove after adding set theory example
The above quote is followed by an example of how to convert a set theory description into a SQL query. This ability, once practiced well, would allow scribbling on napkins to convey computer operations that when written out as SQL would work immediately for source code in software creation. A calculus tends to afford simpler operations to do much more challenging work, and the domain relational calculus which admits set theory expression of SQL queries is no disappointment to such a claim.

#bibliography("shared.bib")
