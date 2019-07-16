as yet unclassified
constructAsmMap: assocs
	"For disassembly purposes, select the most specific symbolic names
	in a map.  For example, on SPARC, GPR %o1 is also called %r9.
	Of course, we can't know the intended symbolic form, but we at least
	attempt to say that %o1 is kind of more descriptive than %r9.
	
	This method works at the level of one map.  Assocs is a collection
	in which 	each element came from parsing one line (aka one map body).
	Each body then gives a collection of one (Form 1) or many individual
	arrows, which do not exist at the syntactic level.  For example,
	9->'%r9' is an arrow of cardinality 32, 9->'o1' has cardinality 8,
	and 14->'%sp' has cardinality 1.
	
	Answer a Dictionary mapping ints to the symbols of least cardinality
	(e.g., 9->'o1'). "
	| cardinalities answer |
	cardinalities := Dictionary new.
	answer := Dictionary new.
	assocs do: [ :aMapBody |
		aMapBody do: [ :crdIntSym "cardinality->int->sym" |
			| existingCardinality cardinality int sym |
			cardinality := crdIntSym key.
			int := crdIntSym value key.
			sym := crdIntSym value value.
			existingCardinality := cardinalities at: int ifAbsent: [-1].
			existingCardinality == -1 ifTrue: [ "Brand new"
				cardinalities at: int put: cardinality.
				answer at: int put: sym ]
			ifFalse: [ "Already exists, let's see if ours is better"
				existingCardinality > cardinality ifTrue: [
					cardinalities at: int put: cardinality.
					answer at: int put: sym ] ] ] ].
	^answer