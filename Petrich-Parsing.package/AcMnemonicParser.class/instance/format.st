grammar
format
	^ ($" asParser,
	(( PPPredicateObjectParser anyExceptAnyOf: '"' ) star flatten ==> [ :x |
		(AcMnemonicFormatParser maps: self class maps) parse: x ]),
	$" asParser) ==> [ :f | f second ]