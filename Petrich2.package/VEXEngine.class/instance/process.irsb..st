execution
process: aSimState irsb: anIRSB
	| newThing theSuccessors |
	newThing := self  process: (
		Dictionary new
			at: 'state' put: aSimState;
			at: 'irsb' put: anIRSB;
			yourself
	).
	theSuccessors := newThing @'flat_successors'.
	theSuccessors size > 1 ifTrue: [ self shouldBeImplemented ].
	^theSuccessors first