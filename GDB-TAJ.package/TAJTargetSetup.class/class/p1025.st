settings
p1025
	"Freescale TWR-P1025 PowerPC e500v2"
	| arch |
	arch := TAJPowerArchitecture resetDefault.
	^self new
		gdbClass: BufferingExecutableAwareGDB;
		host: '192.168.75.199';
		port: 7000;
		architecture: arch;
		instructionStreamClass: TargetAgnosticInstructionStream;
		
		"twge r2,r2; see gdb/gdbserver/linux-ppc-low.c.
		ptrace will happily send SIGTRAP for any tw,
		but gdb's breakpoint_at() will be confused unless
		the memory contents are exactly what it thinks
		the SW break instruction is."
		magicInstruction: 16r7D821008;
		breakpointKind: #trap;
		yourself