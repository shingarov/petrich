RSP commands
writeByte: int toAddr: addr
	| textualAddr answer data |
	data := int printStringBase: 16 length: 2 padded: true.
	textualAddr := addr printStringBase: 16 length: 8 padded: true.
	answer := self
		q: 'M', textualAddr,  ',1:', data.
	answer = 'OK' ifFalse: [ self error: answer ].

