tests
testLoadPDL
	" The most basic test --
	  just load the PDL and ensure basic sanity.
	  If this fails, everything else probably will, too. "
	| dr drIB |
	dr := self pdl instructionAt: #dump_registers.
	drIB := dr internalBindings.
	self assert: (drIB at: 'op2b') equals: 16rDD00.