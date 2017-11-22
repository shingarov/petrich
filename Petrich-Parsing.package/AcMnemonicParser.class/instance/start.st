grammar
start
	^$( asParser,
	format,
	operands,
	$) asParser ==>
	[  :x |
	AcMnemonicSpec
		format: (x second)
		operandsAndConstraints: (x third) ]