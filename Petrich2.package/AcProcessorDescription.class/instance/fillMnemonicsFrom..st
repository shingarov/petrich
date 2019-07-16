collaboration with parser
fillMnemonicsFrom: aCollectionOfAssociations
	| mnemonicAssociations |
	mnemonicAssociations := aCollectionOfAssociations select: [ :ass |
		ass key = 'set_asm'].
	mnemonicAssociations := mnemonicAssociations collect: [ :ass | ass value ].
	mnemonicAssociations do: [ :ass |
		| instructionName instruction |
		instructionName := ass key.
		instruction := instructions at: instructionName.
		instruction addMnemonic:  ((AcMnemonicParser maps: self maps) parse: ass value).
	]

