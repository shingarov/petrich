tests
testOr32
	| l r binop |
	l := VexConstExpr con: (VexU32 value: 16rFFFF0000).
	r := VexRdTmp tmpNo: 3.
	binop := VexBinop op: 'Iop_Or32' left: l right: r.
	self assert: binop op equals: 'Iop_Or32'.
	self assert: binop left con value equals: 16rFFFF0000.
	self assert: binop right tmp equals: 3.