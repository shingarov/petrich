settings
gem5PPC
	| arch |
	arch := TAJPowerArchitecture resetDefault.
	^self new
		gdbClass: NBExecutableAwareGDB; "NBExecutableAwareGDB"
		host: '127.0.0.1';
		port: 7000;
		architecture: arch;
		instructionStreamClass: TargetAgnosticInstructionStream;
		breakpointKind: #hard;
		magicInstruction: (((arch isa instructionAt: #ore) bind: (Dictionary new
			at: 'ra' put: 1;
			at: 'rb' put: 1;
			at: 'rs' put: 1;
			at: 'rc' put: 0;
			yourself)) emit);
		yourself