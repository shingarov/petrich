grammar
idiom
	^#word asParser star flatten trim,
	${ asParser trim,
	(PPPredicateObjectParser anyExceptAnyOf: '}') star flatten,
	$} asParser trim ==> [ :x | x first -> (self compileBlock: x third) ]