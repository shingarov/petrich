working directory
baseDirectory
	(VirtualMachine new buildDate beginsWith: 'Mac')
		ifTrue: [^'/Users/boris/PDL/'].
	(VirtualMachine new buildDate beginsWith: 'Unix')
		ifTrue: [^'/home/boris/PDL/'].
	self error: 'Where am I???'