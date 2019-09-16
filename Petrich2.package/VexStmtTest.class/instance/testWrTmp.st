tests
testWrTmp
	| wr c |
	c := VexConstExpr con: (VexU32 value: 16r12345678).
	wr := VexWrTmp t: 5 expr: c.
	self assert: wr tag equals: 'Ist_WrTmp'.
	self assert: wr tmp equals: 5.
	self assert: wr data con value == 16r12345678.
