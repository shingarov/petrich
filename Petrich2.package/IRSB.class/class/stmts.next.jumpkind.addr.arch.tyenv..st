instance creation
stmts: collectionOfStmts next: nextExpr jumpkind: aString addr: addr arch: archInfo tyenv: tyenv
	| ref  args |
	
	args := Array
		with: tyenv
		with: collectionOfStmts
		with: nextExpr
		with: 'Ijk_Boring'
		with: 16r100
		with: archInfo.
	ref := GenericPyObject create: 'IRSB.from_py' constructorSequentialArgs: args.
	^ref