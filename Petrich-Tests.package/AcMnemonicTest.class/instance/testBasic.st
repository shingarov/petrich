tests - simple
testBasic
	| mnem spec result |
	mnem := '("Literal string")'.
	spec := self forPowerPC parse: mnem.
	result := spec disassembleEnv: Dictionary new.
	self assert: result = ('Literal string' -> 0)