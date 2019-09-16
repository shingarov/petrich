tests
testWIN
	" RemoteGDB testWIN  "
	| gdb  |
	gdb := (RemoteGDBSession
		host: 'vm-boris1'
		port: 7000
		processorDescription: AcProcessorDescriptions sparcv8).
	self halt.
