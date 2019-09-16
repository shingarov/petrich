instance creation
addr: startAddress len: nBytes delta: d
	^self construct: 'pyvex.stmt.IMark( ',
		startAddress printString, ', ',
		nBytes printString, ', ',
		d printString,
		' )'