accessing
initializeWithMemory: aByteArray
	| page pagedMemory ram |
	page := RAMPage
		contents: aByteArray
		startAddr: 0
		permissions: 2r111.	
	pagedMemory := SimPagedMemory with: page state: state.
	ram := SymbolicRAM pagedMemory: pagedMemory endian: state archInfo @'memory_endness'.
	state at: 'memory' put: ram