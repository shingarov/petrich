RSP commands
writeBytes: aByteArray toAddr: addr
	| textualAddr currAddr answer |
	currAddr := addr.
	aByteArray do: [ :byte |
		| data |
		data := byte printStringBase: 16 length: 2 padded: true.
		textualAddr := currAddr printStringBase: 16 length: 8 padded: true.
		answer := self
			q: 'M', textualAddr,  ',1:', data.
		answer = 'OK' ifFalse: [ self error: answer ].
		currAddr := currAddr + 1
	]