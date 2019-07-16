code writing
appendByte: bitString to: anOrderedCollection
	| nextByte |
	nextByte := bitString copyFrom: 1 to: 8.
	nextByte := Integer readFrom: nextByte base: 2.
	self pdl endian == #big
		ifTrue: [ anOrderedCollection addLast: nextByte ]
		ifFalse: [ anOrderedCollection addFirst: nextByte ].
	bitString size == 8 ifTrue: [ ^'' ].
	^bitString copyFrom: 9 to: bitString size 
	
	