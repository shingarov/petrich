tests - instructions - ARM
testArmAND1
	| groundedInstr s |
	groundedInstr := self and1 bind: (Dictionary new
		at: 'cond' put: 12;
		at: 's' put: 1;
		at: 'rd' put: 0;
		at: 'rn' put: 0;
		at: 'rm' put: 13;
		at: 'shiftamount' put: 0;
		at: 'shift' put: 0;
		yourself).
	s := groundedInstr disassemble.
	self assert:  s = 'andgts a1, a1, sp'