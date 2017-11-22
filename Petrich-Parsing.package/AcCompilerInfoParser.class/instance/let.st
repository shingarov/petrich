grammar-semantics
let
	^'let' asParser trim,
	letOpDefinitions,
	'in' asParser trim ==> [ :x |
		| answer |
		answer := Dictionary new.
		x second do: [ :aLet |
				answer at: aLet key put: aLet value ].
		answer ]