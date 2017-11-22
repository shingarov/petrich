grammar
delay
	^id,
	'.delay(' asParser,
	decimalNumber,
	');' asParser
	==> [ :x | 'delay' -> x ]