instance creation
addr: startAddress len: nBytes delta: d
	^self construct: 'IMark( ',
		startAddress printString, ', ',
		nBytes printString, ', ',
		d printString,
		' )'