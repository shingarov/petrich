collaboration with parser
fillSemanticsFrom: aCollectionOfAssociations
	| semanticAssociations |
	tgtimm := (aCollectionOfAssociations detect: [ :ass | ass key = 'tgtimm_size' ]) value.
	abi := (aCollectionOfAssociations detect: [ :ass | ass key = 'abi' ]) value.
	semanticAssociations := aCollectionOfAssociations select: [ :ass |
		ass key = 'semantic'].
	semanticAssociations := semanticAssociations collect: [ :ass | ass value ].
	semanticAssociations do: [ :ass |
		| instructionName instruction semanticForest |
		instructionName := ass key.
		semanticForest := ass value.
		instruction := instructions at: instructionName.
		semanticForest instruction: instruction.
		"instruction semantics add: semanticForest." "we are in LWISEM, do that here instead"
	]
