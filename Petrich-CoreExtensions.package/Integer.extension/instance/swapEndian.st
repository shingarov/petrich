*Petrich-CoreExtensions
swapEndian
	| hex |
	hex := self printStringBase: 16 length: 8 padded: true.
	^Integer readFrom: (hex copyFrom: 7 to: 8),
	(hex copyFrom: 5 to: 6),
	(hex copyFrom: 3 to: 4),
	(hex copyFrom: 1 to: 2)
	base: 16