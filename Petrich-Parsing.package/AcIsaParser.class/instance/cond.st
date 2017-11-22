grammar
cond
	^id,
	'.cond' asParser,
	matchedParen,
	$; asParser
	==> [ :x | 'cond' -> #() ]