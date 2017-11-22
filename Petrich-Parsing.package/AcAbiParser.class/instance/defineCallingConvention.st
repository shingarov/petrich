grammar
defineCallingConvention
	^
	'define' asParser,
	convType,
	'convention for' asParser trim,
	id trim,
	'as' asParser trim,
	(registerConventionDef / stackConventionDef),
	$; asParser
	==> [ :x |
		| convention |
		convention := x at: 6.
		convention isReturn: (x second); id: (x fourth).
		#addCallingConvention: -> convention ]
