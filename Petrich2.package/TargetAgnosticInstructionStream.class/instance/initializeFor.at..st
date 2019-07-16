initialization
initializeFor: aTAJCodeWriter at: aCodePtr
	gdb := aTAJCodeWriter builder memory ram.
	codePtr := aCodePtr.
	breakpointKind := aTAJCodeWriter builder memory targetSetup breakpointKind.
	magicInstruction := aTAJCodeWriter builder memory targetSetup magicInstruction.
	pdl := aTAJCodeWriter processor 
