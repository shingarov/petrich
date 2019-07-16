tests - instructions - PowerPC
testPowerPcMFCTR
	| grounded |
	grounded := self mfspr inEnvironment: (Dictionary new
		at: 'rt' put: 1;
		at: 'sprf' put: 16r120;
		yourself).
	self assert: grounded disassemble equals: 'mfctr 0x1'