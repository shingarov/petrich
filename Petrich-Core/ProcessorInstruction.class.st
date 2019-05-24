"
I represent an instruction where only ""constant"" fields, such as the opcode, are known.
"
Class {
	#name : #ProcessorInstruction,
	#superclass : #Object,
	#instVars : [
		'name',
		'format',
		'internalBindings',
		'mnemonics',
		'semantics',
		'isa'
	],
	#category : 'Petrich-Core'
}

{ #category : #accessing }
ProcessorInstruction >> addMnemonic: aMnemonicSpec [
	self mnemonics add: aMnemonicSpec
]

{ #category : #emitting }
ProcessorInstruction >> arithmeticValueOf: operandName [
	(operandName isKindOf: Integer) ifTrue: [ ^operandName ].
	^internalBindings at: operandName
]

{ #category : #'instruction encoding' }
ProcessorInstruction >> assertWidth [
	| width |
	self
]

{ #category : #instantiating }
ProcessorInstruction >> bind: env [
	"Answer a ProcessorInstruction where the operands are bound to the environment given by the dictionary env."
	| inst |
	inst := GroundedProcessorInstruction new
		format: format;
		name: name;
		internalBindings: (internalBindings copy);
		yourself.
	inst externalBindings: env.
	inst mnemonics: mnemonics.
	^inst
]

{ #category : #instantiating }
ProcessorInstruction >> bindSequence: seq [
	"The operands of an instruction are ordered.
	Answer a GroundedProcessorInstruction whose first operand is bound to (seq first), and so on."
	| allFields operandFields env |
	allFields := format bitFields.
	operandFields := allFields reject: [ :ass | internalBindings includesKey: ass key ].
	operandFields := operandFields reject: [ :ass | ass key isInteger ].
	seq size == operandFields size ifFalse: [
		self error: 'Instruction ', name, ' takes ', operandFields size, ' operands but we are given ', seq size printString  ].
	env := Dictionary new.
	operandFields doWithIndex: [ :field :i |
		| operandValue |
		operandValue := seq at: i.
		"operandValue < (1<<field value abs) ifFalse: [ self halt; error: 'Operand value ', operandValue printString, ' does not fit in ', field value printString, ' bits' ]."
		env at: field key put: operandValue.
		 ].
	^self bind: env
]

{ #category : #disassembly }
ProcessorInstruction >> decode: anInteger [
	"Return the ProcessorInstruction object encoded by anInteger,
	 or nil if this instruction does not match the binary."

	^(GroundedProcessorInstruction new initializeFrom: self)
		decode: anInteger
		accordingTo: format bitFields.

	
]

{ #category : #emitting }
ProcessorInstruction >> emit [
	" Emit the instruction as a binary string of ascii ones and zeros. "
	| currentFormat |
	currentFormat := self format deepCopy.
	^self format bitFields inject: '' into: [ :soFar :field |
		| s |
		s := self stringValueOf: field key usingFormat: currentFormat.
		currentFormat removeFirst.
		soFar, s ]
]

{ #category : #emitting }
ProcessorInstruction >> encodedValueOf: fieldName width: encodedWidth [
	| absWidth operandValue |
	absWidth := encodedWidth abs.
	operandValue := self arithmeticValueOf: fieldName.
	"If the field is signed, encode as two's complement according to the width"
	^encodedWidth negative
		ifTrue: [ operandValue encodeSignedWidth: absWidth ]
		ifFalse: [ operandValue encodeUnsignedWidth: absWidth ].
]

{ #category : #accessing }
ProcessorInstruction >> format [
	^ format
]

{ #category : #accessing }
ProcessorInstruction >> format: anObject [
	format := anObject
]

{ #category : #GT }
ProcessorInstruction >> gtInspectorPreviewIn: composite [
	<gtInspectorPresentationOrder: 20>
	composite morph
		title: 'Bit fields';
		morph: [ InstructionMorph on: self ]
]

{ #category : #accessing }
ProcessorInstruction >> internalBindings [
	^ internalBindings
]

{ #category : #accessing }
ProcessorInstruction >> internalBindings: aDict [
"	aDict keysDo: [ :aKey | format bitFields detect: [ :ass | ass key = aKey ]]."   "???"
	internalBindings := aDict
]

{ #category : #accessing }
ProcessorInstruction >> isa [
	^ isa
]

{ #category : #accessing }
ProcessorInstruction >> isa: anObject [
	isa := anObject
]

{ #category : #accessing }
ProcessorInstruction >> mnemonics [
	mnemonics isNil ifTrue: [ mnemonics := Set new ].
	^ mnemonics
]

{ #category : #accessing }
ProcessorInstruction >> mnemonics: anObject [
	mnemonics := anObject
]

{ #category : #accessing }
ProcessorInstruction >> name [
	^ name
]

{ #category : #accessing }
ProcessorInstruction >> name: anObject [
	name := anObject
]

{ #category : #GT }
ProcessorInstruction >> nameForInspector [
	^self name
]

{ #category : #logic }
ProcessorInstruction >> printLogicOn: aStream [
	semantics ifNil: [ ^self ].
	semantics do: [ :sem | sem printLogicOn: aStream. aStream cr; cr ]
]

{ #category : #printing }
ProcessorInstruction >> printOn: aStream [ 
	aStream nextPutAll: self name
]

{ #category : #accessing }
ProcessorInstruction >> semantics [
	semantics isNil ifTrue: [ semantics := OrderedCollection new ].
	^ semantics
]

{ #category : #emitting }
ProcessorInstruction >> stringValueOf: fieldName usingFormat: f [
	| encodedWidth operandValue |
	encodedWidth := f widthOf: fieldName.
	"if we got here, the field exists, whether external or internal"
		
	[ operandValue := self encodedValueOf: fieldName width: encodedWidth ]
		on: KeyNotFound do: [ ^'?' repeat: encodedWidth abs ].
	^operandValue printStringBase: 2 nDigits: encodedWidth abs
]
