logic
printOperandNumbersOn: aStream
	| operandNumbers  |
	operandNumbers := (term addOperandNumbersTo: let keys asSet) sorted collect: [ :n | 'Op', n printString ].
	operandNumbers printUsing: #putOn: on: aStream