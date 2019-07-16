code writing
appendBitString: bitString to: anOrderedCollection
	| remaining |
	bitString isEmpty ifTrue: [ ^self ].
	bitString size \\ 8 == 0 ifFalse: [ self error: 'Non-integral number of bytes is instruction' ].
	remaining := self appendByte: bitString to: anOrderedCollection.
	self appendBitString: remaining to: anOrderedCollection 