powerpc
testSequence 
	| words instrs |
	words := #( 16r3c60ABCD 16r60631234 ).  "lis 3, ABCD; ori 3,3, 0x1234"
	instrs := AcProcessorDescriptions powerpc disassemble: words.
	self assert: instrs first name equals: 'addis'.
	self assert: instrs last  name equals: 'ori'.
