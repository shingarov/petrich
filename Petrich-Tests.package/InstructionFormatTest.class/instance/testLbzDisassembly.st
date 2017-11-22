tests-powerpc
testLbzDisassembly
	" lbz r2, 0xABCD(r7) "
	| binary instr |
	binary := self anLbz emit.
	self assert: binary = 16r8847ABCD.
	instr := AcProcessorDescriptions powerpc disassemble: binary.
	self assert: instr emit = 16r8847ABCD