grammar
stackConventionDef
	^'stack size' asParser trim,
	positiveNumber trim,
	'alignment' asParser trim,
	positiveNumber
	==> [ :x | AcStackCallingConvention new size: (x second); alignment: (x fourth); yourself ]