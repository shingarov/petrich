RSP commands
read32At: addr
	| answer |
	answer := self q: 'm',
		addr printStringHex,
		',4'.
	processorDescription endian == #little ifTrue: [ answer := answer reverseInt32Endianness ].
	^Integer readFrom: answer radix: 16