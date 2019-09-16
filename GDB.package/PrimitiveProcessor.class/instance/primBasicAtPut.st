object access primitives
primBasicAtPut
	| l idx arg2 |
	"NB - guards"
	l := MTRemoteLiveObject gdb: gdb liveObject: (self getVRegister: #R).
	idx := (self getVRegister: #A) >> 4.
	arg2 := self currentFrame arg: 2.
	l mtBasicAt: idx put: arg2.
	self markSuccess 