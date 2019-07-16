tests - simple
testOneNegate
	| mnem spec env s  |
	mnem := '("R %reg", r=10)'.
	spec := self forPowerPC parse: mnem.
	env := Dictionary new 
		at: 'r' put: 5;
		yourself.
	s := spec disassembleEnv: env.
	self assert: s isNil