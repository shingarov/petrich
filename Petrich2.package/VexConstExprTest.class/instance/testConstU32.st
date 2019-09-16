tests
testConstU32
	| u32 expr readBack |
	u32 := VexU32 value: 16r12345678.
	expr := VexConstExpr con: u32.
	readBack := P fetchVar: expr var.
	self assert: readBack con value equals: 16r12345678
	