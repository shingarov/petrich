as yet unclassified
parse
	| line |
	self isDone ifTrue: [ ^self done ].
	line := self nextLine.
	line isEmpty ifTrue: [ ^self done ].
	satementsSoFar addLast: line.
	^self parse