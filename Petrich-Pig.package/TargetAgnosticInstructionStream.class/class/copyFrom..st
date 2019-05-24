as yet unclassified
copyFrom: prototypeTAIS
	^self new
		gdb: (prototypeTAIS gdb);
		pdl: (prototypeTAIS pdl);
		breakpointKind: (prototypeTAIS breakpointKind);
		codePtr: (prototypeTAIS codePtr);
		yourself