VEX
vezOriAt: addr
	| iMark get wr0 wr1 binop put advance next instrBytes archInfo typeArray typeEnv |
	instrBytes := self binaryEncoding length / 8.
	iMark := VexIMark addr: addr len: instrBytes delta: 0.
	get := VexGET gprOffset: (self fieldValue: 'rs')*4+16.
	wr0 := VexWrTmp t: 0 expr: get.
	binop := VexBinop op: 'Iop_Or32' left: (VexRdTmp tmpNo: 0) right: (VexConstExpr con: (VexUN value: 16 zeros, (self field: 'ui'))).
	wr1 := VexWrTmp t: 1 expr: binop.
	put := VexPUT expr: (VexRdTmp tmpNo: 1) gprOffset: (self fieldValue: 'ra')*4+16.
	next := VexConstExpr con: (VexU32 value: addr+instrBytes).
	advance := VexPUT expr: next gprOffset: 1168. "PC; see libvex_guest_ppc32.h"
	
	archInfo := ArchInfo arch: 'powerpc'.
	typeArray := Array new: 10 withAll: 'Ity_I32'.
	typeEnv := GenericPyObject
		create: 'pyvex.block.IRTypeEnv'
		constructorSequentialArgs: (Array with: archInfo with: typeArray).
	^IRSB
		stmts: (Array with: iMark with: wr0 with: wr1 with: put with: advance)
		next: next
		jumpkind: 'Ijk_Boring'
		addr: addr
		arch: archInfo 
		tyenv: typeEnv 
	