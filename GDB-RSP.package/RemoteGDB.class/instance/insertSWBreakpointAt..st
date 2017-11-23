general query commands
insertSWBreakpointAt: addr
	| answer |
	answer := self q: 'Z1,',
		addr printStringHex,
		',4'.
	answer = 'OK' ifFalse: [ self error ]