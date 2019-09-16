RSP commands
askFeatures
	" Ask the stub for the target feature descriptor.
	  If the stub provides it, override the default in the PDL. "
	| features |
	" must look at qSupported here.  If features is not supported, bail. "
	features := supported detect: [ :s | s beginsWith: 'qXfer:features:' ] ifNone: [ ^self ].
	features = 'qXfer:features:read+' ifFalse: [ self error: 'Havent encountered such a CPU yet; investigate' ].

	features := self qXfer features: 'target.xml'.
	features isNil ifTrue: [ ^self ].
	processorDescription gdb: (GdbXmlParser new processXML: features)
