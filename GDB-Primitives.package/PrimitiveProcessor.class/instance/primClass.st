primitives
primClass
	| rcv md |
	rcv := MTRemoteObject gdb: gdb pointer:  (self getVRegister: #R).
	md := MTRemoteMethodDictionary gdb: gdb pointer: rcv md.
	[ md pointer = self nilObject ] whileFalse: [ 
		| clazz |
		clazz := md definingClass.
		clazz isRemoteNil ifFalse: [ ^self return: clazz pointer ].
		md := md superMd ].
	^self return: self nilObject 