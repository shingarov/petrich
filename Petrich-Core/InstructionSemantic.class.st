Class {
	#name : #InstructionSemantic,
	#superclass : #Object,
	#instVars : [
		'trees',
		'cost',
		'hasDelaySlot',
		'instruction'
	],
	#category : 'Petrich-Core'
}

{ #category : #'instance creation' }
InstructionSemantic class >> trees: aSequenceOfSemanticTrees cost: anInteger hasDelaySlot: aBoolean [
	^self new
		trees: aSequenceOfSemanticTrees ;
		cost: anInteger ;
		hasDelaySlot: aBoolean ;
		yourself
]

{ #category : #accessing }
InstructionSemantic >> cost [
	^ cost
]

{ #category : #accessing }
InstructionSemantic >> cost: anObject [
	cost := anObject
]

{ #category : #accessing }
InstructionSemantic >> hasDelaySlot [
	^ hasDelaySlot
]

{ #category : #accessing }
InstructionSemantic >> hasDelaySlot: anObject [
	hasDelaySlot := anObject
]

{ #category : #accessing }
InstructionSemantic >> instruction [
	^ instruction
]

{ #category : #accessing }
InstructionSemantic >> instruction: backPtrToInstruction [
	instruction := backPtrToInstruction.
	trees do: [ :aSemanticTree | aSemanticTree instruction: backPtrToInstruction ]
]

{ #category : #logic }
InstructionSemantic >> printLogicOn: aStream [
	trees do: [ :semTree | semTree printLogicOn: aStream. aStream lf ]
]

{ #category : #accessing }
InstructionSemantic >> trees [
	^ trees
]

{ #category : #accessing }
InstructionSemantic >> trees: anObject [
	trees := anObject
]
