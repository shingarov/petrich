debug support
findPreviousCallers: maxCallersToFind from: spOrNil
	| sp |
	maxCallersToFind < 1 ifTrue: [ ^OrderedCollection new ].
	sp := spOrNil isNil ifTrue: [ self getVRegister: #SP ] ifFalse: [ spOrNil ].
	[ self isInStack: sp ] whileTrue: [ 
		| slot |
		slot := self read32At: sp.
		sp := sp - 4.
		(self isInNZone: slot) ifTrue: [ ^(self findPreviousCallers: maxCallersToFind - 1 from: sp) addFirst: (exe whereIsPC: slot); yourself ]
	].
	^OrderedCollection new