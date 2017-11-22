grammar
ctor
	^'ISA_CTOR(' asParser,
	id,
	')' asParser trim,
	'{' asParser trim,
	cstorStatement trim star,
	'};' asParser trim
	==> [ :x | x at: 5 ]
