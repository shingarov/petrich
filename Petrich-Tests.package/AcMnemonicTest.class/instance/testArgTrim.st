tests - simple
testArgTrim
	| mnem spec result |
	mnem := '("Damn(%imm)", rt )'.
	spec := self forPowerPC parse: mnem.
	result := spec disassembleEnv: (Dictionary newFromPairs:  #('rt' 5)).
	self assert: result = ('Damn(0x5)'->0)