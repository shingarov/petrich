grammar
definePCOffset
	^'define pcoffset' asParser trim,
	number trim,
	$; asParser ==>
	[ :x | #pcOffset: -> x second ]