collaboration with parser
fillInstructionsFrom: aCollectionOfAssociations
	| instructionAssociations |
	instructionAssociations := aCollectionOfAssociations select: [ :ass |
		ass key = 'ac_instr'].
	instructionAssociations := instructionAssociations collect: [ :ass | ass value ].
	instructions := Dictionary new.
	instructionAssociations do: [ :ass |
		| instruction |
		(instructions includesKey: ass key asSymbol) ifTrue: [ self error: 'Duplicate instruction' ].
		instruction := ProcessorInstruction new.
		instruction
			isa: self;
			name: (ass key);
			format: (instructionFormats  at: ass value asSymbol).
		instructions at: ass key asSymbol put: instruction
	]

