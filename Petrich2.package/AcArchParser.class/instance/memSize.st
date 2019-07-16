grammar
memSize
	^(decimalNumber, $K asParser ==> [ :x | x first * 1024 ] ) /
	(decimalNumber, $M asParser ==> [ :x | x first * 1024 * 1024 ] ) /
	(decimalNumber, $G asParser ==> [ :x | x first * 1024 * 1024 * 1024 ] ) /
	decimalNumber