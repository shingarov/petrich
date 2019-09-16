instance creation
host: h port: p processorDescription: pd
	"Create an instance, connect to the remote server, and fully prepare the debugging session."
	^(self host: h port: p)
		processorDescription: pd;
		prepareSession;
		yourself