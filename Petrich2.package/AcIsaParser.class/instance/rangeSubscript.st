grammar
rangeSubscript
	^$[ asParser,
	number,
	'..' asParser,
	number,
	$] asParser
	==> [ :x | x second to: x fourth ]