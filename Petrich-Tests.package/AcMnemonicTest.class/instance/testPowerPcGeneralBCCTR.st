tests - instructions - PowerPC
testPowerPcGeneralBCCTR
	| groundedInstr  |
	groundedInstr := self bcctr bind: (Dictionary new
		at: 'bo' put: 1;
		at: 'bi' put: 2;
		at: 'bh' put: 3;
		yourself).
	self assert: groundedInstr disassemble = 'bcctr 1, 2, 3'