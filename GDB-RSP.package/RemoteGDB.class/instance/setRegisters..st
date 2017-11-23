RSP commands
setRegisters: aDict
	| answer stream registerTransfers |
	stream := WriteStream on: String new.
	registerTransfers := processorDescription gdb.
	registerTransfers do: [ :rt |
		rt write: aDict to: stream ].
	
	answer := self q: 'G', stream contents.	
	answer = 'OK' ifFalse: [self error: answer]