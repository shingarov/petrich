instance creation
stmts: collectionOfStmts next: nextExpr jumpkind: aString addr: addr
	| archInfo typeArray typeEnv |
	archInfo := ArchInfo arch: 'powerpc'.
	typeArray := Array new: 10 withAll: 'Ity_I32'.
	typeEnv := GenericPyObject
		create: 'block.IRTypeEnv'
		constructorSequentialArgs: (Array with: archInfo with: typeArray).
	^self stmts: collectionOfStmts next: nextExpr jumpkind: aString addr: addr arch: archInfo tyenv: typeEnv