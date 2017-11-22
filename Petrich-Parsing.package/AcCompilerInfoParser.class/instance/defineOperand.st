grammar-registers
defineOperand
	^'define operand' asParser trim,
	$; asParser negate star,
	$; asParser
	==> [ :x | 'operand' -> x ]