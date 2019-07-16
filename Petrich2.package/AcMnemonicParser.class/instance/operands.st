grammar
operands
	^($, asParser trim, operandOrConstraint trim) star ==>
	[  :x | x collect: [ :op | op second  ]]