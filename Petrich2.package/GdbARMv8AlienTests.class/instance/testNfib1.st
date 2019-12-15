tests
testNfib1
	"self new testNfib1"
	self should: [self runNFib: 1 disassemble: false printRegisters: false]
		raise: Error
		withExceptionDo: 
			[:err|
			 self assert: err class = ProcessorSimulationTrap.
			 self assert: #return = err type.
			 self assert: 16r1000 equals: err address].
	self deny: (self processor pc between: 0 and: self nfib size).
	self assert: self processor r0 = 1 benchFib