lifting
liftStartingAt: anAddress
	^IRSB
		stmts: (self liftStatementsStartingAt: anAddress)
		next: (VexConstExpr con: (VexU32 value: self nextAddress))
		jumpkind: 'Ijk_Boring'
		addr: anAddress
