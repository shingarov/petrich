allocating
allocSlotsFromMTXMemory: numSlots
	| nBytes |
	nBytes := numSlots * 4.
	^self gdb exe objectMemory alloc: nBytes