primitives
primAllocEnv
	| stackFrame count ptr env |
	count := gdb currentBytecode count.
	stackFrame := self currentFrame.
	ptr := self allocSlots: count serviceSlots: 2 "header, hash".
	env := MTRemoteIndexedPart gdb: gdb pointer: ptr.
	env header: (TAJObjectWriter
		declareObjectHeaderType: 'IndexedPartType'
		hashFormat: 'NoHash'
		numVars: count
		hash: 0
		meta: 0).
	env basicSlotAt: 1 put: stackFrame env pointer.
	stackFrame env: env.
	self setVRegister: #X to: ptr.
