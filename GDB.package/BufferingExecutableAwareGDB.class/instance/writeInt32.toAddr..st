API
writeInt32: int toAddr: addr
	leftFinger isNil ifTrue: [
		^self buffer
			at: addr - self minAddr + 1 put: ((int bitAnd: 16rFF000000) >> 24);
			at: addr - self minAddr + 2 put: ((int bitAnd: 16r00FF0000) >> 16);
			at: addr - self minAddr + 3 put: ((int bitAnd: 16r0000FF00) >> 8);
			at: addr - self minAddr + 4 put: (int bitAnd: 16r000000FF) ].
	super writeInt32: int toAddr: addr
