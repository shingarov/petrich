reading
readFrom: aStream
	| bytes |
	bytes := aStream next: width//4.
	isLittleEndian ifTrue: [ bytes := bytes reverseInt32Endianness ].
	"TODO - Different types (e.g. IEEE-754)"
	[^Integer readFrom: bytes base: 16] on: Error do: [ self halt ]