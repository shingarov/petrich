Class {
	#name : #AgNode,
	#superclass : #Object,
	#category : 'Petrich-InstructionSelector'
}

{ #category : #testing }
AgNode >> isOperand [
	^false

]

{ #category : #testing }
AgNode >> isOperator [
	^false

]

{ #category : #testing }
AgNode >> isTransferDestination [
	self subclassResponsibility
]

{ #category : #testing }
AgNode >> isTransferDestination: aBoolean [
	self subclassResponsibility
]

{ #category : #testing }
AgNode >> size [
	^0
]

{ #category : #testing }
AgNode >> type [
	^0
]
