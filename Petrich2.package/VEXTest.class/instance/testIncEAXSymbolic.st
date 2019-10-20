tests-x86
testIncEAXSymbolic
	| x specialSimulationState irsb finalState |
	specialSimulationState := SimState ensureArch: 'IA32'.
	x := IntSymbol sym: 'X' length: 32.
	specialSimulationState registers at: 'eax' put: x.
	irsb := self incEAX.
	finalState := VEXEngine newEngine process: specialSimulationState irsb: irsb.
	self assert: (finalState registers at: 'eax') equals: (x+1).
	self assert: finalState ip equals: 16r101
