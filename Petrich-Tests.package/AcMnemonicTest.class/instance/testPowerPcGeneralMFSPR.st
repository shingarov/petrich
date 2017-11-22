tests - instructions - PowerPC
testPowerPcGeneralMFSPR
	| groundedInstr s |
	groundedInstr := self mfspr bind: (Dictionary new
		at: 'rt' put: 3;
		at: 'sprf' put: 16r23;
		yourself).
	s := groundedInstr disassemble.
	self assert: s = 'mfspr 0x3, 0x23'