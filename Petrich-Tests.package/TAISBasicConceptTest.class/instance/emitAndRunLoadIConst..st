tests
emitAndRunLoadIConst: aTargetBuilder
	| s gdb motherSmalltalkNZone innerSmalltalkNZone pcBeforeBCCTR |
	innerSmalltalkNZone := aTargetBuilder executable objectMemory layout nZone. "read from what the live thin shell has put into R16"
	gdb := aTargetBuilder executable objectMemory ram.

	s := TargetAgnosticInstructionStream forCodeWriter: aTargetBuilder codeWriter.
	motherSmalltalkNZone := s codePtr.  "this is where we will begin writing instructions"
	
	self assert: innerSmalltalkNZone equals: motherSmalltalkNZone.

	
	"emit a LoadImm32"
	s nextPutIdiom: 'LoadImm32' op1: 1 op2: 16r12345678.
	s nextPutIdiom: 'Return'.
	
	"execute instructions"
	gdb s; s; s; s; s; s; s; s. "nops"
	gdb s. "mtctr"
	pcBeforeBCCTR := gdb getRegisters at: 'pc'.
	gdb s. "bcctr"
	
	"now we are in n-zone"
	self assert: (gdb getRegisters at: 'pc') equals: motherSmalltalkNZone.
	
	gdb s; s. "the LoadImm32"
	self assert: (gdb getRegisters at: 'r1') equals: 16r12345678.
	gdb s. "Return"
	
	"now we are back in the thin shell"
	self assert: (gdb getRegisters at: 'pc') equals: pcBeforeBCCTR + 4.
	
	"exactly 3 instructions left in thinshell:"
	gdb s; s. "transform the oop of 42 into 42"
	[ gdb s ] "syscall to exit()"
		on: GdbChildExited do: [ ^self ].
		
	self error: 'Program should have just terminated'