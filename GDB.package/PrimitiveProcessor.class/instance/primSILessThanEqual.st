integer primitives
primSILessThanEqual
	self return: ((self getVRegister: #R) <= (self getVRegister: #A)
		ifTrue: [ self trueObject ]
		ifFalse: [ self falseObject ])