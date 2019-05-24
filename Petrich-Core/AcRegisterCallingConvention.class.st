Class {
	#name : #AcRegisterCallingConvention,
	#superclass : #AcCallingConvention,
	#instVars : [
		'registers'
	],
	#category : 'Petrich-Core'
}

{ #category : #accessing }
AcRegisterCallingConvention >> registers [
	^ registers
]

{ #category : #accessing }
AcRegisterCallingConvention >> registers: anObject [
	registers := anObject
]
