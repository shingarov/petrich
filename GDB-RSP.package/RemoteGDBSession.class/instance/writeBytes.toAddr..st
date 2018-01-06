RSP commands
writeBytes: aByteArray toAddr: addr
	| buffer textualAddr answer textualSize |
	buffer := WriteStream on: ''.
	aByteArray do: [ :aByte |
		| data |
		data := aByte printStringBase: 16 length: 2 padded: true.
		buffer nextPutAll: data
	].
	textualAddr := addr printStringBase: 16 length: 8 padded: true.
	textualSize := aByteArray size  printStringBase: 16.
	answer := self
		q: 'M', textualAddr,  ',', textualSize, ':', buffer contents.
	answer = 'OK' ifFalse: [ self halt ].

