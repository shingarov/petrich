settings
gem86
	| arch |
	arch := TAJIA32Architecture resetDefault.
	^self new
		gdbClass: BufferingExecutableAwareGDB;
		host: '192.168.75.2';
		port: 7000;
		architecture: arch;
		instructionStreamClass: TargetAgnosticInstructionStream;
		
		"bogus, I still don't what it should be on x86"
		magicInstruction: 16r0;
		breakpointKind: #trap;
		yourself