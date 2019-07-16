grammar
gprOperand
	^'gpr(' asParser,
	decimal,
	')' asParser ==> [ :x | x second ]