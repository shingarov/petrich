Class {
	#name : #AgOperand,
	#superclass : #AgNode,
	#instVars : [
		'name',
		'type',
		'isSpecificReference',
		'acceptsSpecificReference',
		'isTransferDestination',
		'manager'
	],
	#category : 'Petrich-InstructionSelector'
}

{ #category : #accessing }
AgOperand >> acceptsSpecificReference [
	^ acceptsSpecificReference
]

{ #category : #accessing }
AgOperand >> acceptsSpecificReference: anObject [
	acceptsSpecificReference := anObject
]

{ #category : #testing }
AgOperand >> isOperand [
	^true
]

{ #category : #accessing }
AgOperand >> isSpecificReference [
	^ isSpecificReference
]

{ #category : #accessing }
AgOperand >> isSpecificReference: anObject [
	isSpecificReference := anObject
]

{ #category : #accessing }
AgOperand >> isTransferDestination [
	^ isTransferDestination 
]

{ #category : #accessing }
AgOperand >> isTransferDestination: aBoolean [
	isTransferDestination := aBoolean
]

{ #category : #accessing }
AgOperand >> manager [
	^ manager
]

{ #category : #accessing }
AgOperand >> manager: anObject [
	manager := anObject
]

{ #category : #accessing }
AgOperand >> name [
	^ name
]

{ #category : #accessing }
AgOperand >> name: anObject [
	name := anObject
]

{ #category : #accessing }
AgOperand >> type [
	^ type
]

{ #category : #accessing }
AgOperand >> type: anObject [
	type := anObject
]
