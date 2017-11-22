grammar
ctor
	^'ARCH_CTOR(' asParser trim, id, ')' asParser trim,
	${ asParser,
	ctorComponent trim star,
	'};' asParser
	==> [ :x | x at: 5 ]