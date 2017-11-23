RSP commands
writeInt32: int toAddr: addr
	| textualAddr answer data |
	data := int printStringBase: 16 length: 8 padded: true.
	processorDescription endian == #little ifTrue: [ data := data reverseInt32Endianness ].
	textualAddr := addr printStringBase: 16 length: 8 padded: true.
	answer := self
		q: 'M', textualAddr,  ',4:', data.
	answer = 'OK' ifFalse: [ self error: answer ].

