grammar
negativeNumber
	^$- asParser, positiveNumber
	==> [ :x | x last negated ]