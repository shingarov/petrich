RSP commands
askFeatures
	" Ask the stub for the target feature descriptor.
	  If the stub provides it, override the default in the PDL. "
	| features |
	" must look at qSupported here.  If features is not supported, bail. "
	^self.
	"
	features := self qXfer features: 'target.xml'.
	features isNil ifTrue: [ ^self ].
	processorDescription gdb: (GdbXmlParser new processXML: features)
	"