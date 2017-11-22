grammar-registers
defineRegisters
	^'define registers' asParser trim,
	id,
	$: asParser,
	id,
	#space asParser star,
	'as' asParser trim,
	$( asParser trim,
	registerListSpaceSeparated,
	');' asParser trim
	==> [ :x | 'registers' -> x ]