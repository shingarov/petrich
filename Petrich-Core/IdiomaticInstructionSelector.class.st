"
I represent the pre-solved I/O effect equation for a number of parametrized solution families.

At the JIT synthesis time, a number of IR tree fragments, or ""idioms"", are considered and the native instruction sequences are constructed for them, parametrized by some operands.  For example, PushR is an idiom.  These native sequences are stored in an IdiomaticInstructionSelector object (only one for a particular JIT, but you will need to construct a different one for a different ISA, or for a different idiom set).

At runtime, when the idiom 'IdiomName' is encoutered with operands op1, op2, sending 

anIIS emitIdiom: 'IdiomName' with: op1 with:  op2: 

will look up the idiom, resulting in a two-argument block; that block is sent #value:value:, resulting in a SequenceableCollection of fully-grounded processor instructions.  For the programmer's convenience, these are then assembled into binary and the resulting sequence of binary instructions is returned.

Note that the actual semantics are completely opaque at this level.

Note also that certain parameters are part of synthesis; for example, PushR operates on two register specs: which register to push, and which register is the SP.  However, the SP knowledge is fully dealt with at the synthesis phase, so the idiom only takes one operand (R).


"
Class {
	#name : #IdiomaticInstructionSelector,
	#superclass : #Object,
	#instVars : [
		'invS',
		'pdl'
	],
	#category : 'Petrich-Core'
}

{ #category : #'instance creation' }
IdiomaticInstructionSelector class >> pdl: pdl [
	^self basicNew pdl: pdl; initialize
]

{ #category : #'binary emission' }
IdiomaticInstructionSelector >> assembleBinary: instrCollection [
	^instrCollection collect: [ :instr | instr emit ]
]

{ #category : #'binary emission' }
IdiomaticInstructionSelector >> emitIdiom: idiomName [
	^self assembleBinary: ((invS at: idiomName) value)
]

{ #category : #'binary emission' }
IdiomaticInstructionSelector >> emitIdiom: idiomName with: op1 [
	^self assembleBinary: ((invS at: idiomName) value: op1)
]

{ #category : #'binary emission' }
IdiomaticInstructionSelector >> emitIdiom: idiomName with: op1 with: op2 [
	^self assembleBinary: ((invS at: idiomName) value: op1 value: op2)
]

{ #category : #'binary emission' }
IdiomaticInstructionSelector >> emitIdiom: idiomName with: op1 with: op2 with: op3 [

	^self assembleBinary: ((invS at: idiomName) value: op1 value: op2 value: op3)
]

{ #category : #'binary emission' }
IdiomaticInstructionSelector >> emitIdiom: idiomName with: op1 with: op2 with: op3 with: op4 [

	^self assembleBinary: ((invS at: idiomName) value: op1 value: op2 value: op3 value: op4)
]

{ #category : #'binary emission' }
IdiomaticInstructionSelector >> emitIdiom: idiomName with: op1 with: op2 with: op3 with: op4 with: op5 [

	^self assembleBinary: ((invS at: idiomName)
		valueWithArguments: (Array with: op1 with: op2 with: op3 with: op4 with: op5))
]

{ #category : #'binary emission' }
IdiomaticInstructionSelector >> emitIdiom: idiomName withOperands: operands [
	^self assembleBinary: ((invS at: idiomName) valueWithArguments: operands)
]

{ #category : #'idiom access' }
IdiomaticInstructionSelector >> idiomAt: idiomName [
	^invS at: idiomName 
]

{ #category : #'idiom access' }
IdiomaticInstructionSelector >> idiomAt: idiomName put: aBlock [
	^invS at: idiomName put: aBlock 
]

{ #category : #initialize }
IdiomaticInstructionSelector >> initialize [
	self initializeFromFile
]

{ #category : #examples }
IdiomaticInstructionSelector >> initializeFromFile [
	| dir f fcontents |
	dir := '/home/boris/PIG/'.
	f := FileStream fileNamed: dir, 'isel-', pdl architectureName.
	fcontents := f contentsOfEntireFile.
	f close.
	invS := (SInvParser instructionSelector: self) 	parse: fcontents
]

{ #category : #examples }
IdiomaticInstructionSelector >> initializeFromPig [
	invS := (SInvParser instructionSelector: self)
			parse: SWIProlog new solveS
]

{ #category : #'block convenience' }
IdiomaticInstructionSelector >> instr: anInstructionNameSymbol [
	^self instr: anInstructionNameSymbol	bindAll: #()
]

{ #category : #'block convenience' }
IdiomaticInstructionSelector >> instr: anInstructionNameSymbol bind: op1 [
	^self instr: anInstructionNameSymbol	bindAll: (Array with: op1)
]

{ #category : #'block convenience' }
IdiomaticInstructionSelector >> instr: anInstructionNameSymbol bind: op1 bind: op2 [
	^self instr: anInstructionNameSymbol	bindAll: (Array with: op1 with: op2)
]

{ #category : #'block convenience' }
IdiomaticInstructionSelector >> instr: anInstructionNameSymbol bind: op1 bind: op2 bind: op3 [
	^self instr: anInstructionNameSymbol	bindAll: (Array with: op1 with: op2 with: op3)
]

{ #category : #'block convenience' }
IdiomaticInstructionSelector >> instr: anInstructionNameSymbol bind: op1 bind: op2 bind: op3 bind: op4 [
	^self instr: anInstructionNameSymbol	bindAll: (Array with: op1 with: op2 with: op3 with: op4)
]

{ #category : #'block convenience' }
IdiomaticInstructionSelector >> instr: anInstructionNameSymbol bind: op1 bind: op2 bind: op3 bind: op4 bind: op5 [
	^self instr: anInstructionNameSymbol	bindAll: (Array with: op1 with: op2 with: op3 with: op4 with: op5)
]

{ #category : #'block convenience' }
IdiomaticInstructionSelector >> instr: anInstructionNameSymbol bindAll: ops [
	^(self pdl instructionAt: anInstructionNameSymbol)
		bindSequence: ops
]

{ #category : #accessing }
IdiomaticInstructionSelector >> pdl [
	^ pdl
]

{ #category : #accessing }
IdiomaticInstructionSelector >> pdl: aProcessorDescription [
	pdl := aProcessorDescription 
]
