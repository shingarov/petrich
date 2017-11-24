emitting
valueOf: operandName
	(operandName isKindOf: Integer) ifTrue: [ ^operandName ].
	^internalBindings at: operandName ifAbsent: [ 
		externalBindings at: operandName ifAbsent: [ self error: 'Operand ''', operandName, ''' undefined' ]
	]