grammar
pseudoInstrConstituent
	^'"' asParser,
	'";' asParser negate star,
	'";' asParser