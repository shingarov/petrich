settings
gem5MIPS
	| arch |
	arch := TAJMIPSArchitecture resetDefault.
	^self new
		gdbClass: NBExecutableAwareGDB8K;
		host: '192.168.75.2';
		port: 7000;
		architecture: arch;
		instructionStreamClass: TargetAgnosticInstructionStream;
		breakpointKind: #hard;
		magicInstruction: (((arch isa instructionAt: #sll) bind: (Dictionary new
			at: 'rs' put: 0;
			at: 'rt' put: 0;
			at: 'rd' put: 0;
			at: 'shamt' put: 0;
			yourself)) emit);
		yourself