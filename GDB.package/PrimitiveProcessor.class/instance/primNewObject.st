primitives
primNewObject
	| clazz  |
	clazz := MTRemoteClass gdb: gdb pointer: self receiverOop.
	self return: (self
		allocOop: clazz instVarCount
		md: clazz instanceMd)