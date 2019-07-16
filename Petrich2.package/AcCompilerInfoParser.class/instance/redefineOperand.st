grammar-abi
redefineOperand
	^'redefine operand tgtimm size to ' asParser,
	positiveNumber,
	$; asParser
	==> [ :x | 'tgtimm_size' -> x second ]