tests - instructions - PowerPC
testPowerPcMFCTR
	| groundedInstr s |
	groundedInstr := self mfspr bind: (Dictionary new
		at: 'rt' put: 1;
		at: 'sprf' put: 16r120;
		yourself).
	s := groundedInstr disassemble.
	self assert: s = 'mfctr 0x1'