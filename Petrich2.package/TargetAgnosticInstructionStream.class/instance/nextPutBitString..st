code writing
nextPutBitString: bitString
	| bytes |
	bytes := OrderedCollection new.
	self appendBitString: bitString to: bytes.
	bytes := ByteArray withAll: bytes asByteArray.
	self gdb writeBytes: bytes toAddr: codePtr.
	self advance: bytes size