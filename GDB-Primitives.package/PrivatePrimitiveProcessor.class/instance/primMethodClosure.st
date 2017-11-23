primitives
primMethodClosure
	|  stackFrame method blocks ptr md count block blockClosure numArgs blockClosureMDKey |

	count := gdb currentBytecode count.
	stackFrame := self currentFrame.
	method := stackFrame method.
	blocks := method blocks.
	block := MTRemoteCompiledBlock gdb: gdb pointer: (blocks at: count).
	numArgs := block numArgs.
	blockClosureMDKey := (Array
		with: #MTZeroArgumentBlockClosure_md
		with: #MTOneArgumentBlockClosure_md
		with: #MTTwoArgumentBlockClosure_md
	) at: numArgs + 1.
	md := gdb exe externalReferences at: blockClosureMDKey.
	ptr := self allocOop: 4 md: md.
	blockClosure := MTRemoteBlockClosure gdb: gdb pointer: ptr.
	blockClosure 
		literals: method literals;
		compiledBlock: block;
		env:(stackFrame env);
		receiver: (MTRemoteObject gdb: gdb pointer: (self getVRegister: #R)).
	self setVRegister: #R to: ptr.