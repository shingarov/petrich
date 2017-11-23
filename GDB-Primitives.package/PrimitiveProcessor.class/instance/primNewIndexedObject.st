primitives
primNewIndexedObject
	| clazz size |
self halt.
	size := (self getVRegister: #A) >> 4.
size >= (65536*4) ifTrue:[self halt].
	clazz := MTRemoteClass gdb: gdb pointer: self receiverOop.
	clazz structure = 5
		ifTrue: [ self allocString: size md: clazz instanceMd ]
		ifFalse: [ self allocIndexed: size md: clazz instanceMd ]