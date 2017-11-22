grammar
isa
	^'AC_ISA(' asParser trim,
	id,
	')' asParser trim,
	'{' asParser trim,
	instructionStatement trim star,
	'};' asParser trim
	==> [ :x | x at: 5 ]
