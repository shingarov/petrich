Class {
	#name : #GdbProcessorSpecific,
	#superclass : #Object,
	#instVars : [
		'registerTransfers',
		'defines'
	],
	#category : 'Petrich-Core'
}

{ #category : #accessing }
GdbProcessorSpecific >> defines [
	^ defines
]

{ #category : #accessing }
GdbProcessorSpecific >> defines: anObject [
	defines := anObject
]

{ #category : #accessing }
GdbProcessorSpecific >> registerTransfers [
	^ registerTransfers
]

{ #category : #accessing }
GdbProcessorSpecific >> registerTransfers: anObject [
	registerTransfers := anObject
]
