RSP commands
writeInt32s: arrayOfInt32s toAddr: addr
	| buffer textualAddr answer textualSize |
	buffer := WriteStream on: ''.
	arrayOfInt32s do: [ :anInt32 |
		| data |
		data := anInt32 printStringBase: 16 length: 8 padded: true.
		processorDescription endian == #little ifTrue: [ data := data reverseInt32Endianness ].
		buffer nextPutAll: data
	].
	textualAddr := addr printStringBase: 16 length: 8 padded: true.
	textualSize := arrayOfInt32s size * 4 printStringBase: 16.
	answer := self
		q: 'M', textualAddr,  ',', textualSize, ':', buffer contents.
	answer = 'OK' ifFalse: [ self halt ].

