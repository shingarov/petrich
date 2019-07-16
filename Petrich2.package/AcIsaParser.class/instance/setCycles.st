grammar
setCycles
	^id,
	'.set_cycles(' asParser,
	decimalNumber,
	');' asParser
	==> [ :x | 'set_cycles' -> (x first -> x third) ]