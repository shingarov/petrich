tests - simple
testOneReg
	| mnem spec env s  |
	mnem := '("R %reg", r)'.
	spec := self forPowerPC parse: mnem.
	env := Dictionary new 
		at: 'r' put: 5;
		yourself.
	s := spec disassembleEnv: env.
	self assert: s key = 'R 5'