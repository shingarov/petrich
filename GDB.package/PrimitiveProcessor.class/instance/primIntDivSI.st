integer primitives
primIntDivSI
	| r a d |
	r := self getVRegister: #R.
	(r bitAnd: 2r111) = 2r0001 ifFalse:[ ^self markFail ].
	r := gdb exe architecture smallIntegerToInteger: r.
	a := self getVRegister: #A.
	(a bitAnd: 2r111) = 2r0001 ifFalse:[ ^self markFail ].
	a := gdb exe architecture smallIntegerToInteger: a.
	d := r // a.
	d := gdb exe architecture integerToSmallInteger: d.
	self return: d