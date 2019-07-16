API
disassembleEnv: aDictionary
	"Given the operand environment aDictionary,
	 answer a string of disassembly, or nil if
	 the environment does not fit this spec.
	 The answer is given in the form of Association,
	 whose key is the string of disassembly and the
	 value is an integer indicating the number of 
	 bound operands.  The latter is used to select
	 the most sepecific mnemonic form."
	
	| s operandValues |
	"First, see if we satisfy the constraints."
	constraints do: [ :constraint |
		(constraint satisfy: aDictionary) ifFalse: [ ^nil ] ].
	
	operandValues := operands collect: [ :op | op value: aDictionary ].
	s := format value: operandValues asOrderedCollection.
	^ s -> constraints size