Extension { #name : #Integer }

{ #category : #'*Petrich-CoreExtensions' }
Integer class >> binaryOnes: n [
	"Make a positive integer of n ones,
	e.g. Integer binaryOnes: 4 is 2r1111."
	^1 << n - 1
]

{ #category : #'*Petrich-CoreExtensions' }
Integer >> decodeSignedWidth: w [
	"For example, 16rFFFF encodeUnsignedAsSignedWidth: 16 is -1."
	self < (1<<w) ifFalse: [self error].
	self < (1<<(w-1)) ifTrue: [ 
		"positive"
		^self
	] ifFalse: [ 
		"negative"
		^self - (1 << w)
	 ]

]

{ #category : #'*Petrich-CoreExtensions' }
Integer >> encodeSignedWidth: w [
	self positive ifTrue: [ 
		self < (1<<(w - 1)) ifFalse: [self error].
		^self
	] ifFalse: [
		self abs <= (1<<(w - 1)) ifFalse: [ self error ].
		^(Integer binaryOnes: w) - (self abs - 1)
	 ]
]

{ #category : #'*Petrich-CoreExtensions' }
Integer >> encodeUnsignedWidth: w [
	self < (1<<w) ifFalse: [self error].
	^self

]

{ #category : #'*Petrich-CoreExtensions' }
Integer >> swapEndian [
	| hex |
	hex := self printStringBase: 16 length: 8 padded: true.
	^Integer readFrom: (hex copyFrom: 7 to: 8),
	(hex copyFrom: 5 to: 6),
	(hex copyFrom: 3 to: 4),
	(hex copyFrom: 1 to: 2)
	base: 16
]
