*Petrich2
binaryOnes: n
	"Make a positive integer of n ones,
	e.g. Integer binaryOnes: 4 is 2r1111."
	self shouldBeImplemented. "Now that we have machine arithmetic, this is inappropriate"
	^1 << n - 1