tests - instructions - ARM
testArmAdd3
	| groundedInstr s |
	groundedInstr := self add3 bind: (Dictionary new
		at: 'cond' put: 12;
		at: 's' put: 1;
		at: 'rd' put: 2;
		at: 'rn' put: 3;
		at: 'rotate' put: 3;
		at: 'imm8' put: 4;
		yourself).
	s := groundedInstr disassemble.
	self assert:  s = 'addgts a3, a4, #0x7(aimm)'