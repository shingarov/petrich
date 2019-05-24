Class {
	#name : #AcProcessorDescription,
	#superclass : #Object,
	#instVars : [
		'memories',
		'regbanks',
		'regs',
		'maps',
		'wordsize',
		'endian',
		'instructionFormats',
		'instructions',
		'gdb',
		'tgtimm',
		'architectureName',
		'abi'
	],
	#category : 'Petrich-Core'
}

{ #category : #'as yet unclassified' }
AcProcessorDescription class >> systemIcon [
	^Form extent: 12@12 depth: 32 fromArray: (#(
1 1 1 0 1 0 1 0 1 0 1 1
1 1 1 0 1 0 1 0 1 0 1 1
1 1 0 0 0 0 0 0 0 0 0 1
0 0 0 1 1 1 1 1 1 1 0 0
1 1 0 1 0 0 0 0 0 1 0 1
0 0 0 1 0 1 1 1 0 1 0 0
1 1 0 1 0 1 1 1 0 1 0 1
0 0 0 1 0 1 1 1 0 1 0 0
1 1 0 1 0 0 0 0 0 1 0 1
0 0 0 1 1 1 1 1 1 1 0 0
1 1 0 0 0 0 0 0 0 0 0 1
1 1 1 0 1 0 1 0 1 0 1 1
) collect: [ :x | x==1 ifTrue: [ 16rFFFFFFFF ] ifFalse: [ 16rFF000000 ]])
	offset: 0@0

]

{ #category : #accessing }
AcProcessorDescription >> architectureName [
	^ architectureName 
]

{ #category : #accessing }
AcProcessorDescription >> architectureName: aString [
	architectureName := aString
]

{ #category : #disassembly }
AcProcessorDescription >> disassemble: anInteger [
	"Answer the AcInstructionInstance object encoded by anInteger."
	| candidates |
	candidates := instructions collect: [ :instr |
		instr decode: anInteger ].
	candidates := candidates reject: [ :instr | instr isNil ].
	candidates isEmpty ifTrue: [self error: 'Invalid instruction encoding'].
	^(candidates asSortedCollection:  [ :a :b | a externalBindingBits < b externalBindingBits ]) first
]

{ #category : #accessing }
AcProcessorDescription >> endian [
	^ endian
]

{ #category : #'collaboration with parser' }
AcProcessorDescription >> fillDecodersFrom: aCollectionOfAssociations [
	| decoderAssociations |
	decoderAssociations := aCollectionOfAssociations select: [ :ass |
		ass key = 'set_decoder'].
	decoderAssociations := decoderAssociations collect: [ :ass | ass value ].
	decoderAssociations do: [ :ass |
		| instructionName instruction |
		instructionName := ass key.
		instruction := instructions at: instructionName.
		instruction internalBindings: ass value.
	]


]

{ #category : #'collaboration with parser' }
AcProcessorDescription >> fillFrom: aCollectionOfAssociations [
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
]

{ #category : #'collaboration with parser' }
AcProcessorDescription >> fillISAFrom: aCollectionOfAssociations [
	self
		fillInstructionFormatsFrom: aCollectionOfAssociations;
		fillMapsFrom: aCollectionOfAssociations; "important that this is done before fillMnemonics"
		fillInstructionsFrom: aCollectionOfAssociations;
		fillDecodersFrom: aCollectionOfAssociations;
		fillMnemonicsFrom: aCollectionOfAssociations 


]

{ #category : #'collaboration with parser' }
AcProcessorDescription >> fillInstructionFormatsFrom: aCollectionOfAssociations [
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


]

{ #category : #'collaboration with parser' }
AcProcessorDescription >> fillInstructionsFrom: aCollectionOfAssociations [
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


]

{ #category : #'collaboration with parser' }
AcProcessorDescription >> fillMapsFrom: aCollectionOfAssociations [
	| mapAssociations |
	mapAssociations := aCollectionOfAssociations select: [ :ass |
		ass key = 'ac_map'].
	mapAssociations := mapAssociations collect: [ :ass | ass value ].
	maps := Dictionary newFromAssociations: mapAssociations
]

{ #category : #'collaboration with parser' }
AcProcessorDescription >> fillMnemonicsFrom: aCollectionOfAssociations [
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


]

{ #category : #'collaboration with parser' }
AcProcessorDescription >> fillSemanticsFrom: aCollectionOfAssociations [
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
		instruction semantics add: semanticForest.
	]

]

{ #category : #accessing }
AcProcessorDescription >> gdb [
	" NB: This is NOT about an instance of RSP client.
	  Instead, this is a specification of how register values are transferred;
	  the returned value is a SequenceableCollection of register transfers.
	  It ultimately comes from parsing the Processor Feature Definition. "
	^ gdb
]

{ #category : #accessing }
AcProcessorDescription >> gdb: aSequenceableCollectionOfRT [
	gdb := aSequenceableCollectionOfRT
]

{ #category : #accessing }
AcProcessorDescription >> instructionAt: instructionNameSymbol [
	^instructions at: instructionNameSymbol 
]

{ #category : #accessing }
AcProcessorDescription >> instructionFormats [
	^instructionFormats
]

{ #category : #accessing }
AcProcessorDescription >> maps [
	^ maps
	"Do not lazy-initialize here; the Dictionary instance is created in #fillMapsFrom:"
]

{ #category : #private }
AcProcessorDescription >> parsedElementsNamed: key from: aCollectionOfAssociations [
	^(aCollectionOfAssociations select: [ :ass | ass key = key ]) collect: [ :ass | ass value ]

]

{ #category : #printing }
AcProcessorDescription >> printOn: aStream [ 
	aStream nextPutAll: 'AC_ARCH(', self architectureName, ')'
]

{ #category : #accessing }
AcProcessorDescription >> tgtimm [
	^ tgtimm 
]

{ #category : #accessing }
AcProcessorDescription >> wordsize [
	^wordsize
]