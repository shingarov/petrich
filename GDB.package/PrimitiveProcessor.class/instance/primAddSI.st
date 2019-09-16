integer primitives
primAddSI
	| r a sum |
	r := self getVRegister: #R.
	(r bitAnd: 2r11) = 2r0001 ifFalse:[ ^self markFail ].
	r := gdb exe architecture smallIntegerToInteger: r.
	a := self getVRegister: #A.
	(a bitAnd: 2r11) = 2r0001 ifFalse:[ ^self markFail ].
	a := gdb exe architecture smallIntegerToInteger: a.
	sum := r + a.
	sum := gdb exe architecture integerToSmallInteger: sum.
	self return: sum