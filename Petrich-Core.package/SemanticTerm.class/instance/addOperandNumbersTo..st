logic
addOperandNumbersTo: aSet 
	args do: [ :arg | arg addOperandNumbersTo: aSet ].
	^aSet