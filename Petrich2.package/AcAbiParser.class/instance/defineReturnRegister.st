grammar
defineReturnRegister
	^'define return register as' asParser trim,
	registerName trim,
	$; asParser
	==> [ :x | #retReg: -> x second ]