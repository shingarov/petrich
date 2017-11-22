grammar
defineProgramCounter
	^'define programcounter register as' asParser trim,
	registerName trim,
	$; asParser ==>
	[ :x | #pcReg: -> x second ]