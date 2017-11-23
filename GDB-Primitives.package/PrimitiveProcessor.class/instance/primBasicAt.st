object access primitives
primBasicAt
	| l |
	"NB - guards"
	l := MTRemoteLiveObject gdb: gdb liveObject: (self getVRegister: #R).
	self return: (l mtBasicAt: (self getVRegister: #A) >> 4)