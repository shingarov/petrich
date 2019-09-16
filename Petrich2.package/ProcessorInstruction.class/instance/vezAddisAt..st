VEX
vezAddisAt: addr
	| iMark put u32 constExpr advance next instrBytes rt archInfo typeArray typeEnv |
	
	instrBytes := self binaryEncoding length / 8.
	iMark := VexIMark addr: addr len: instrBytes delta: 0.
	u32 := VexUN value: (self field: 'd'), 16 zeros.
	constExpr := VexConstExpr con: u32.
	rt := self fieldValue: 'rt'.
	put := VexPUT expr: constExpr gprOffset: rt*4+16.
	next := VexConstExpr con: (VexU32 value: addr+instrBytes).
	advance := VexPUT expr: next gprOffset: 1168. "PC; see libvex_guest_ppc32.h"
	archInfo := ArchInfo arch: 'powerpc'.
	typeArray := Array new: 10 withAll: 'Ity_I32'.
	typeEnv := GenericPyObject
		create: 'pyvex.block.IRTypeEnv'
		constructorSequentialArgs: (Array with: archInfo with: typeArray).
	^IRSB
		stmts: (Array with: iMark with: put with: advance)
		next: next
		jumpkind: 'Ijk_Boring'
		addr: addr
		arch: archInfo 
		tyenv: typeEnv 