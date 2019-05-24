Class {
	#name : #SInvParser,
	#superclass : #PPCompositeParser,
	#instVars : [
		'decimal',
		'idiom',
		'instructionSelector'
	],
	#category : 'Petrich-Parsing'
}

{ #category : #'instance creation' }
SInvParser class >> instructionSelector: isel [
	^self new 
		instructionSelector: isel
]

{ #category : #grammar }
SInvParser >> compileBlock: sourceString [
	^OpalCompiler new
		class: self class;
		receiver: instructionSelector;
		source: sourceString;
		evaluate 
]

{ #category : #grammar }
SInvParser >> decimal [
	^($- asParser optional, #digit asParser plus) flatten
	==> [ :x | x asInteger ]
]

{ #category : #grammar }
SInvParser >> idiom [
	^#word asParser star flatten trim,
	${ asParser trim,
	(PPPredicateObjectParser anyExceptAnyOf: '}') star flatten,
	$} asParser trim ==> [ :x | x first -> (self compileBlock: x third) ]
]

{ #category : #accessing }
SInvParser >> instructionSelector [
	^ instructionSelector
]

{ #category : #accessing }
SInvParser >> instructionSelector: anObject [
	instructionSelector := anObject
]

{ #category : #grammar }
SInvParser >> start [
	"
	(SInvParser pdl: AcProcessorDescriptions powerpc) parse:
	SWIProlog new solveS
	"
	^idiom star ==> [ :assocs | Dictionary newFromAssociations: assocs ]
]
