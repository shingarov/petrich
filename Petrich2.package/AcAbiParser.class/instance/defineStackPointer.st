grammar
defineStackPointer
	^'define stackpointer register as' asParser trim,
	registerName trim,
	$; asParser  ==>
	[ :x | #spReg: -> x second ]