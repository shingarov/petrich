grammar
defineStackGrows
	"I have not seen it defined differently on any architecture."
	^'define stack grows' asParser trim,
	(('down' asParser ==> [ :x | -1]) / ('up' asParser ==> [ :x | 1 ])) trim,
	'alignment' asParser trim,
	positiveNumber trim,
	$; asParser ==>
	[ :x | #stackGrowsAlignment: -> (x second * x fourth) ]