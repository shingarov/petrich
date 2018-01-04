grammar
setAsm
	^id,
	'.set_asm' asParser trim,
	matchedParen,
	';' asParser
	==> [ :x | 'set_asm' -> (x first -> x third) ]