as yet unclassified
primitiveResetCPU
	"In Squeak:
	Reset the receiver to registers all zero, and protected 32-bit mode."
	state := SimState ensureArch: 'IA32'.
	