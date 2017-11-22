grammar
asmMapBody2
	"Map body, Form 2:  STR[i..i] = [i..i]; "
	^str,
	rangeSubscript,
	$= asParser trim,
	rangeSubscript,
	$; asParser
	==> [ :x |
		| name l r answer |
		name := x first.
		l := x second.
		r := x fourth.
		l size = r size ifFalse: [ self error: l incommensurable: r ].
		answer := Array new: l size.
		r doWithIndex: [ :rightSubscript :i |
			answer
				at: i
				put: l size -> (rightSubscript -> (name, (l at: i) printString )) ].
		answer
		]