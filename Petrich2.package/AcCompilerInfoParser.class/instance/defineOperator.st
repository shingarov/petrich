grammar-machine specific
defineOperator
	^'define operator' asParser trim,
	$; asParser negate star,
	$; asParser
	==> [ :x | 'operator' -> x ]