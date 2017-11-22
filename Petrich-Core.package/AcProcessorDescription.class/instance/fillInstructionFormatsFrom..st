collaboration with parser
fillInstructionFormatsFrom: aCollectionOfAssociations
	| formatAssociations |
	formatAssociations := aCollectionOfAssociations select: [ :ass |
		ass key = 'ac_format'].
	formatAssociations := formatAssociations collect: [ :ass | ass value ].
	instructionFormats := Dictionary new.
	formatAssociations do: [ :ass |
		| format |
		(instructionFormats includesKey: ass key asSymbol) ifTrue: [ self error: 'Duplicate instruction format' ].
		format := AcInstructionFormat new.
		format bitFields: ass value.
		format name: ass key.
		format assertWidth.
		instructionFormats at: ass key asSymbol put: format
	]

