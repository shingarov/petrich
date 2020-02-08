tests
testElioticBlob 
	| proj arch entry factory specialSimulationState simgr successors successorState regs |
	arch := ArchInfo arch: 'powerpc'.
	proj := GenericPyObject
		create: 'angr.load_shellcode'
		constructorNamedArgs:
			('shellcode' -> #[1 2 3 4 5 6 7 8]),
			('arch' -> arch),
			('minReadAddress' -> 0),
			('minWriteAddress' -> 4).
	self assert: proj pyClass name equals: 'Project'.
	factory := proj @ 'factory'.
	specialSimulationState := factory blank_state: ('addr' -> 0).
	self assert: (specialSimulationState memory @'mem') pyClass name equals: 'SimPagedMemory'
