"
An ISA defines several ""instruction formats"" consisting of a plurality of ""bit fields"".
Each processor instruction is encoded according to one of these formats.
For example, the ""ori ra, rs, #imm"" instruction in the PowerPC ISA is encoded according to the D4 format, which consists of 4 bit fields:
opcd:6,
rs:5,
ra:5,
ui:16.

"
Class {
	#name : #AcInstructionFormat,
	#superclass : #Object,
	#instVars : [
		'name',
		'bitFields'
	],
	#category : 'Petrich-Core'
}

{ #category : #'instruction encoding' }
AcInstructionFormat >> assertWidth [
	| width |
	width := bitFields
		inject: 0
		into: [ :current :bitFieldAssoc | current + bitFieldAssoc value abs ]
]

{ #category : #accessing }
AcInstructionFormat >> bitFields [
	^ bitFields
]

{ #category : #accessing }
AcInstructionFormat >> bitFields: anObject [
	bitFields := anObject
]

{ #category : #emitting }
AcInstructionFormat >> emit [
	^self bitFields inject: '' into: [ :soFar :field |
		| fieldName s |
		fieldName := field key.
		s := (fieldName isKindOf: Integer)
			ifTrue: [ fieldName printStringBase: 2 nDigits: field value ]
			ifFalse: [ '#' repeat: field value abs ].
		soFar, s ]
]

{ #category : #accessing }
AcInstructionFormat >> name [
	^ name
]

{ #category : #accessing }
AcInstructionFormat >> name: aString [
	name := aString
]

{ #category : #printing }
AcInstructionFormat >> printOn: aStream [ 
	aStream
		nextPutAll: 'Instruction format ';
		nextPutAll: name;
		nextPutAll: ' '.
	bitFields printElementsOn: aStream
]

{ #category : #accessing }
AcInstructionFormat >> removeFirst [
	self bitFields: self bitFields allButFirst 
]

{ #category : #accessing }
AcInstructionFormat >> widthOf: fieldName [
	" Answer the width of the field, negated if the field
	  is a two's complement-encoded signed.
	  Assume the field exists, otherwise crash."
	
	"NB we can't use Dictionary>>newFromAssociations:, because some
	 constant (Integer-named) fields can have the same key.
	 See InstructionFormatTest>>testMcrf"
	self bitFields do: [ :assoc |
		assoc key = fieldName ifTrue: [ ^assoc value ]
	].
	KeyNotFound signalFor: fieldName
]
