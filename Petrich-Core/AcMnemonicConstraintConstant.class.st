Class {
	#name : #AcMnemonicConstraintConstant,
	#superclass : #AcMnemonicConstraint,
	#instVars : [
		'c'
	],
	#category : 'Petrich-Core'
}

{ #category : #accessing }
AcMnemonicConstraintConstant >> c [
	^ c
]

{ #category : #accessing }
AcMnemonicConstraintConstant >> c: anObject [
	c := anObject
]

{ #category : #API }
AcMnemonicConstraintConstant >> satisfy: env [
	^(env at: op ifAbsent: [ nil ]) = c
]