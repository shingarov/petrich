syscall sequences
exitSyscall: rtnInt
	| loadSyscallNo loadReturnValue sc |
	loadSyscallNo := (pdl instructionAt: #addi) bind: (Dictionary new
		at: 'ra' put: 0;
		at: 'rt' put: 0;
		at: 'd' put: 1;
		yourself).
	loadReturnValue := (pdl instructionAt: #addi) bind: (Dictionary new
		at: 'ra' put: 0;
		at: 'rt' put: 3;
		at: 'd' put: rtnInt;
		yourself).
	sc := (pdl instructionAt: #sc) bind: (Dictionary new
		at: 'lev' put: 0;
		yourself).
	^(Array with: loadSyscallNo with: loadReturnValue with: sc)
	collect: [ :instr | instr emit ]