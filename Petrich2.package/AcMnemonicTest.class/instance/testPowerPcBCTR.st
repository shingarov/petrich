tests - instructions - PowerPC
testPowerPcBCTR
	| groundedInstr  |
	groundedInstr := self bcctr bind: (Dictionary new
		at: 'bo' put: 16r14;
		at: 'bi' put: 0;
		at: 'bh' put: 0;
		yourself).
	self assert: groundedInstr disassemble = 'bctr'