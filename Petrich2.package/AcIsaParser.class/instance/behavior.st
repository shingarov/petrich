grammar
behavior
	^id,
	'.behavior' asParser,
	matchedParen,
	$; asParser
	==> [ :x |
		'ac_behavior' -> (x first -> x third) ]