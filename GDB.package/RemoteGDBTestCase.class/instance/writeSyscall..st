syscall sequences
writeSyscall: aByteArray
	| loadSyscallNo loadFD loadBuf loadLength sc |
	loadSyscallNo := (pdl instructionAt: #addi) bind: (Dictionary new
		at: 'ra' put: 0;
		at: 'rt' put: 0;
		at: 'd' put: 4;
		yourself).
	loadFD := (pdl instructionAt: #addi) bind: (Dictionary new
		at: 'ra' put: 0;
		at: 'rt' put: 3;
		at: 'd' put: 1;
		yourself).
	loadBuf := (pdl instructionAt: #addi) bind: (Dictionary new
		at: 'ra' put: 17;
		at: 'rt' put: 4;
		at: 'd' put: 0;
		yourself).
	loadLength := (pdl instructionAt: #addi) bind: (Dictionary new
		at: 'ra' put: 0;
		at: 'rt' put: 5;
		at: 'd' put: (aByteArray size);
		yourself).
	sc := (pdl instructionAt: #sc) bind: (Dictionary new
		at: 'lev' put: 0;
		yourself).
	^(Array with: loadSyscallNo with: loadFD with: loadBuf with: loadLength with: sc)
	collect: [ :instr | instr emit ]