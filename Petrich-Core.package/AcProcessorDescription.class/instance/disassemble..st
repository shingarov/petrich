disassembly
disassemble: anInteger
	"Answer the AcInstructionInstance object encoded by anInteger."
	instructions valuesDo: [ :instr |
		| instance |
		instance := instr decode: anInteger.
		instance == nil ifFalse: [ ^instance ]].
	self error: 'Invalid instruction encoding'
