parsing
parse
	| line |
	self isDone ifTrue: [ ^self done ].
	line := self nextLine.
	line isEmpty ifTrue: [ ^self parse ].
	instructionDictionary
		at: line
		put: (CollectingIRStatements from: readStream satementsSoFar: OrderedCollection new) parse.
	^self parse