grammar
processorDescription
	^'AC_ARCH(' asParser trim, id, ')' asParser,
	'{' asParser trim,
	component trim star,
	'};' asParser trim
	==> [ :x | x second -> x fifth  ]