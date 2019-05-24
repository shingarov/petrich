"
I am a fully grounded (i.e, all operands bound) instruction,
and therefore ready to be emitted.
"
Class {
	#name : #GroundedProcessorInstruction,
	#superclass : #ProcessorInstruction,
	#instVars : [
		'externalBindings'
	],
	#category : 'Petrich-Core'
}

{ #category : #comparing }
GroundedProcessorInstruction >> = anotherInstruction [
	self == anotherInstruction ifTrue: [^ true].
	^self emit = anotherInstruction emit
	

]

{ #category : #emitting }
GroundedProcessorInstruction >> arithmeticValueOf: operandName [
	(operandName isKindOf: Integer) ifTrue: [ ^operandName ].
	^internalBindings at: operandName ifAbsent: [ 	externalBindings at: operandName ]
]

{ #category : #initializing }
GroundedProcessorInstruction >> bind: env [
	"I am already bound, ant it's final."
	self shouldNotImplement
]

{ #category : #disassembly }
GroundedProcessorInstruction >> decode: anInteger accordingTo: bitfieldAssociationSequence [
	"This unfortunate method factorization is forced by an opportunity for improvement in the Pharo debugger.
	Modify thyself according to the bitfieldAssociationSequence specification whose values are either
	verified to correspond to (if internal), or set to (if external), the bit values in anInteger.
	If internal values are wrong (so it's the wrong instruction), answer nil."
	| firstBitfield width value fieldName |
	bitfieldAssociationSequence size == 0 ifTrue: [ ^self ].
	firstBitfield := bitfieldAssociationSequence first.
	width := firstBitfield value abs.
	value := anInteger >> (32 - width).
	fieldName := firstBitfield key.
	[(internalBindings at: fieldName) = value ifFalse: [^nil]]
		on: KeyNotFound
		do: [ :ex | externalBindings at: fieldName put: value ].
	^self
		decode: (anInteger << width bitAnd: 16rFFFFFFFF)
		accordingTo: (bitfieldAssociationSequence copyFrom: 2 to: bitfieldAssociationSequence size).

]

{ #category : #disassembly }
GroundedProcessorInstruction >> disassemble [
	| variants |
	variants := mnemonics collect: [ :mnem |
		mnem disassembleEnv: externalBindings ].
	variants := variants reject: [ :v | v isNil ].
	variants := variants sorted: [ :a :b | a value > b value ].
	^variants first key
]

{ #category : #emitting }
GroundedProcessorInstruction >> emit32 [
	" Emit the instruction as a 32-bit integer. "
	| s |
	s := self emit.
	s size = 32 ifFalse: [ self error: 'Instruction size not 32' ].
	^Integer readFrom: s base: 2
]

{ #category : #disassembly }
GroundedProcessorInstruction >> externalBindingBits [
	"Answer the total number of bits in external-bound operands."
	^self externalBindings keys
		inject: 0
		into: [:subTotal :nextField | subTotal + (format widthOf: nextField) ].
	
]

{ #category : #accessing }
GroundedProcessorInstruction >> externalBindings [
	^ externalBindings
]

{ #category : #accessing }
GroundedProcessorInstruction >> externalBindings: aDictionary [
	externalBindings := aDictionary
]

{ #category : #comparing }
GroundedProcessorInstruction >> hash [
	^self emit hash
]

{ #category : #initializing }
GroundedProcessorInstruction >> initializeFrom: anInstruction [
	name := anInstruction name.
	isa := anInstruction isa.
	format := anInstruction format.
	internalBindings := anInstruction internalBindings copy.
	mnemonics := anInstruction mnemonics.
	semantics := anInstruction semantics.
	externalBindings := Dictionary new.
	^self
]

{ #category : #printing }
GroundedProcessorInstruction >> printOn: aStream [
	[ aStream nextPutAll: self disassemble ]
		on: Error
		do: [ aStream nextPutAll: 'a GroundedProcessorInstruction [error disassembling]' ]
	
]
