primitives
primClassName
	| rcv |
	"The argument is a class."
	rcv := MTRemoteClass gdb: gdb pointer:  (self getVRegister: #R).
	self return: rcv name