collaboration with parser
fillFrom: aCollectionOfAssociations
	memories := self parsedElementsNamed: 'ac_mem' from:  aCollectionOfAssociations.
	regs := self parsedElementsNamed: 'ac_reg' from:  aCollectionOfAssociations.
	regbanks := self parsedElementsNamed: 'ac_regbank' from:  aCollectionOfAssociations.
	wordsize := (aCollectionOfAssociations detect: [ :ass | ass key = 'ac_wordsize' ]) value.
	endian := (aCollectionOfAssociations detect: [ :ass | ass key = 'endian' ]) value.

	gdb := (aCollectionOfAssociations detect: [ :ass | ass key = 'ac_gdb' ]) value.
	endian == #little ifTrue: [ gdb do: [ :eachRegisterTransfer | eachRegisterTransfer isLittleEndian: true ] ].
	
	self
		fillISAFrom: ((aCollectionOfAssociations detect: [ :ass | ass key = 'ac_isa' ]) value);
		fillSemanticsFrom: (aCollectionOfAssociations detect: [ :ass | ass key = 'SEMANTICS' ]) value.
	^self