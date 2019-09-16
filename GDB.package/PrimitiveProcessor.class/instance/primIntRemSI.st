integer primitives
primIntRemSI
	| r a rem |
	r := self getVRegister: #R.
	(r bitAnd: 2r11) = 2r0001 ifFalse:[ ^self markFail ].
	r := gdb exe architecture smallIntegerToInteger: r.
	a := self getVRegister: #A.
	(a bitAnd: 2r11) = 2r0001 ifFalse:[ ^self markFail ].
	a := gdb exe architecture smallIntegerToInteger: a.
	rem  := r \\ a.
	rem := gdb exe architecture integerToSmallInteger: rem.
	self return: rem