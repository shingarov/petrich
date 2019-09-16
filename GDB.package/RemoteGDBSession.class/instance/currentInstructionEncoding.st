RSP commands
currentInstructionEncoding
	| pc |
	pc := 	self getRegisters at: 'pc'.  "BOGUS CODE"
	^self read32At: pc