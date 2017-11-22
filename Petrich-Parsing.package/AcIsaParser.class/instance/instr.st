grammar
instr
	^'ac_instr<' asParser,
	id,
	$> asParser,
	#space asParser star,
	idList,
	$; asParser
	==> [ :x |
		| instrs f |
		f := x second.
		instrs := x fifth.
		instrs collect: [ :i |
			'ac_instr' -> ( i -> f )
		] ]
