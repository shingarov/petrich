grammar-semantics
letOpDefinitions
	^letOpDefinition,
	($, asParser trim, letOpDefinition) star
	==> [ :x |
		| answer |
		answer := OrderedCollection with: x first.
		x second do: [ :y | answer add: y second ].
		answer ]