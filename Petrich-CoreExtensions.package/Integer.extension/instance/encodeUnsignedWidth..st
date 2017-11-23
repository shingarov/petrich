*Petrich-CoreExtensions
encodeUnsignedWidth: w
	self < (1<<w) ifFalse: [self error].
	^self
