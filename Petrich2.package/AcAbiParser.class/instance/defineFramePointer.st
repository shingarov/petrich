grammar
defineFramePointer
	^'define framepointer register as' asParser trim,
	registerName trim,
	$; asParser  ==>
	[ :x | #fpReg: -> x second ]