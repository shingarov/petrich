grammar
wordsize
	^'ac_wordsize' asParser trim, decimalNumber, $; asParser
		==> [ :x | Array with: 'ac_wordsize' -> x second ]