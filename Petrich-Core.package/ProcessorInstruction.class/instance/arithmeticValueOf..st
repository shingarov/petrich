emitting
arithmeticValueOf: operandName
	(operandName isKindOf: Integer) ifTrue: [ ^operandName ].
	^internalBindings at: operandName