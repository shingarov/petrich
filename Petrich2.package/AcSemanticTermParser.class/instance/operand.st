grammar
operand
	^ 'Op' asParser,
	#hex asParser,
	$: asParser,
	#uppercase asParser star flatten ==> [ :x |
		RegisterSemanticOperand new 
			number: ((String with: x second) asInteger);
			type: x fourth;
			yourself ]