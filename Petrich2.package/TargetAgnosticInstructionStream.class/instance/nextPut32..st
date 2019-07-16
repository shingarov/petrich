code writing
nextPut32: aWord
	gdb writeInt32: aWord toAddr: codePtr.
	self advance: 4.