tests - instructions - ARM
testArmAddPC
	| groundedInstr s |
	groundedInstr := self add1 bind: (Dictionary new
		at: 'cond' put: 12;
		at: 's' put: 1;
		at: 'rd' put: 0;
		at: 'rn' put: 15;
		at: 'rm' put: 13;
		at: 'shiftamount' put: 0;
		at: 'shift' put: 0;
		yourself).
	s := groundedInstr disassemble.
	self assert:  s = 'addgts a1, PC, sp'