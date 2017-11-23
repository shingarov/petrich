tests
testSimics
	^(RemoteGDBSession
		host: '192.168.2.188'
		port: 9123
		processorDescription: AcProcessorDescriptions powerpc) testSimics1 
		