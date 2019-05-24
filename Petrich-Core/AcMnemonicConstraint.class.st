Class {
	#name : #AcMnemonicConstraint,
	#superclass : #Object,
	#instVars : [
		'op'
	],
	#category : 'Petrich-Core'
}

{ #category : #accessing }
AcMnemonicConstraint >> op [
	^ op
]

{ #category : #accessing }
AcMnemonicConstraint >> op: anObject [
	op := anObject
]

{ #category : #API }
AcMnemonicConstraint >> satisfy: env [
	" Answer true if the values of operands given in the dictionary env, satisfy me. "
	self subclassResponsibility 
]