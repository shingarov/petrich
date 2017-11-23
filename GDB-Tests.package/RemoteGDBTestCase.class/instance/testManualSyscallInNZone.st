as yet unclassified
testManualSyscallInNZone
	| memLayout writeInstructions exitInstructions |
	self halt.
	self connectGDB.
	memLayout := TrivialMemoryLayout gdb: gdb.
	memLayout executeStartChain.
	writeInstructions := self writeSyscall: self messageBytes.
	exitInstructions := self exitSyscall: 1.
	gdb writeInt32s: writeInstructions, exitInstructions toAddr: memLayout nZone.
	gdb writeBytes: self messageBytes toAddr: memLayout heap.
	
	gdb
		stepUntil: [ gdb currentInstruction name = 'sc' ];
		s.   "the actual write syscall"
	
	gdb s; s; s. "exit"
	Transcript yourself
	