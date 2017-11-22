grammar
setAsm
	^id,
	'.set_asm' asParser,
	matchedParen,
	';' asParser
	==> [ :x | 'set_asm' -> (x first -> x third) ]