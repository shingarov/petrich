tests
testSimpleIRSB
	| irsb iMark put u32 constExpr advance next specialSimulationState finalState regs r3 archInfo typeArray typeEnv |
	specialSimulationState := SimState ensureArch: 'powerpc'.
	iMark := VexIMark addr: 16r100 len: 4 delta: 0.
	u32 := VexU32 value: 16r12345678.
	constExpr := VexConstExpr con: u32.
	put := VexPUT expr: constExpr gprOffset: 28. "r3 on PPC32"
	next := VexConstExpr con: (VexU32 value: 16r104).
	advance := VexPUT expr: next gprOffset: 1168.
	archInfo := ArchInfo arch: 'powerpc'.
	typeArray := Array new: 10 withAll: 'Ity_I32'.
	typeEnv := GenericPyObject
		create: 'block.IRTypeEnv'
		constructorSequentialArgs: (Array with: archInfo with: typeArray).
	irsb := IRSB
		stmts: (Array with: iMark with: put with: advance)
		next: next
		jumpkind: 'Ijk_Boring'
		addr: 16r100
		arch: archInfo
		tyenv: typeEnv.
	finalState := VEXEngine newEngine process: specialSimulationState irsb: irsb.
	regs := finalState @'registers'.
	r3 := regs load: 28.
	self assert: r3 value equals: 16r12345678
	