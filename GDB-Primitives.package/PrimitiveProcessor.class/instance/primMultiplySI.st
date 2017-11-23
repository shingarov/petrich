integer primitives
primMultiplySI
	| r a p |
	r := self getVRegister: #R.
	(r bitAnd: 2r111) = 2r0001 ifFalse:[ ^self markFail ].
	r := gdb exe architecture smallIntegerToInteger: r.
	a := self getVRegister: #A.
	(a bitAnd: 2r111) = 2r0001 ifFalse:[ ^self markFail ].
	a := gdb exe architecture smallIntegerToInteger: a.
	p := r * a.
	p := gdb exe architecture integerToSmallInteger: p.
	self return: p