grammar
asmMapBody1
	"Map body, Form 1: STR symbolList = int;	"
	^strList,
	$= asParser trim,
	number,
	$; asParser
	==> [ :x |
		| names i |
		names := x first.
		i := x third.
		names collect: [ :aName | 1 -> (i -> aName) ]
		]