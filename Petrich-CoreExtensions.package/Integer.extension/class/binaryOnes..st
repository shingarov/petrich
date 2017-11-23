*Petrich-CoreExtensions
binaryOnes: n
	"Make a positive integer of n ones,
	e.g. Integer binaryOnes: 4 is 2r1111."
	^1 << n - 1