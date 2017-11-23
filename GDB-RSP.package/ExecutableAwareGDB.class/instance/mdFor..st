representation
mdFor: oop
	| tagBits   |
	tagBits := oop bitAnd: 3.
	tagBits == 1 ifTrue: [
		"SmallInteger"
		^exe externalReferences at: #MTSmallInteger_md ].
	tagBits == 3 ifTrue: [ 
		"Context"
		^exe externalReferences at: #MTContext_md ].
	^self read32At: oop + 4