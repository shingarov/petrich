grammar
registerConventionDef
	^$( asParser,
	registerName trim star,
	$) asParser
	==> [ :x |
		AcRegisterCallingConvention new registers: (x second); yourself ]