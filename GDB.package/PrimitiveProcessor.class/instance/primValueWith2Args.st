control primitives
primValueWith2Args
	| arg2 |
	arg2 := self currentFrame arg: 2.
	gdb push: arg2.
	^self primValue