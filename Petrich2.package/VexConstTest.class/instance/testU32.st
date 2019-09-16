tests
testU32
	| c |
	c := VexU32 value: 16r12345678.
	self assert: c value equals: 16r12345678