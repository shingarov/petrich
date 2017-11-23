*Petrich-CoreExtensions
decodeSignedWidth: w
	"For example, 16rFFFF encodeUnsignedAsSignedWidth: 16 is -1."
	self < (1<<w) ifFalse: [self error].
	self < (1<<(w-1)) ifTrue: [ 
		"positive"
		^self
	] ifFalse: [ 
		"negative"
		^self - (1 << w)
	 ]
