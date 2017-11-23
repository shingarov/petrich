*Petrich-CoreExtensions
encodeSignedWidth: w
	self positive ifTrue: [ 
		self < (1<<(w - 1)) ifFalse: [self error].
		^self
	] ifFalse: [
		self abs <= (1<<(w - 1)) ifFalse: [ self error ].
		^(Integer binaryOnes: w) - (self abs - 1)
	 ]