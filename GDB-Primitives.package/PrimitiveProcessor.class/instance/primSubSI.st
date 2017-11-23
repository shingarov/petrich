integer primitives
primSubSI
	| r a diff |
	r := self getVRegister: #R.
	(r bitAnd: 2r111) = 2r0001 ifFalse:[ ^self markFail ].
	r := gdb exe architecture smallIntegerToInteger: r.
	a := self getVRegister: #A.
	(a bitAnd: 2r111) = 2r0001 ifFalse:[ ^self markFail ].
	a := gdb exe architecture smallIntegerToInteger: a.
	diff := r - a.
	diff := gdb exe architecture integerToSmallInteger: diff.
	self return: diff