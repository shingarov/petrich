RSP commands
readByteAt: addr
	^(self readAt: addr nBytes: 1) first