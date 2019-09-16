control primitives
isTerminationContextFor
	| currentCtx startCtx block blockMarkEnv methodMarkEnv matchesP | self halt.
	currentCtx := MTRemoteStackFrame
		gdb: gdb
		pointer: ((self getVRegister: #R) bitAnd: 2r11 bitInvert32).
	startCtx := MTRemoteStackFrame gdb: gdb pointer: ((self getVRegister: #A) bitAnd: 2r11 bitInvert32).
	block := startCtx blockClosure.
	blockMarkEnv := block env markEnv.
	methodMarkEnv := currentCtx env markEnv.
	matchesP := (currentCtx method pointer = block compiledBlock homeMethod pointer) and:
		[ blockMarkEnv pointer = methodMarkEnv pointer ].
	self return: (matchesP 
		ifTrue: [ self trueObject ]
		ifFalse: [ self falseObject ])