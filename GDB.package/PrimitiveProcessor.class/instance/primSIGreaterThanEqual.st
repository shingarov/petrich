integer primitives
primSIGreaterThanEqual
	self return: ((gdb getVRegister: #R) >= (gdb getVRegister: #A)
		ifTrue: [ self trueObject ]
		ifFalse: [ self falseObject ])