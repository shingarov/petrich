tests - simple
testOneBinding
	| mnem spec env s numBoundOperands |
	mnem := '("mov %reg, %reg", rt, rd, c=3)'.
	spec := self forPowerPC parse: mnem.
	env := Dictionary new 
		at: 'rt' put: 5;
		at: 'rd' put: 7;
		at: 'c' put: 3;
		yourself.
	s := spec disassembleEnv: env.
	numBoundOperands := s value.
	self assert: s key = 'mov 5, 7'.
	self assert: numBoundOperands = 1