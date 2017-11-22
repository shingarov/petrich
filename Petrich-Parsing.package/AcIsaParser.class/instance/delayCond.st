grammar
delayCond
	^id,
	'.delay_cond' asParser,
	matchedParen,
	$; asParser
	==> [ :x | 'delay_cond' -> #() ]