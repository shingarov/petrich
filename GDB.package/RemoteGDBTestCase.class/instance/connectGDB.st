as yet unclassified
connectGDB
	pdl := AcProcessorDescriptions powerpc.
	gdb := RemoteGDBSession
		host: '192.168.75.2'
		port: 7000
		processorDescription: pdl.