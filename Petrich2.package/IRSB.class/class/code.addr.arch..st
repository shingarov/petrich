instance creation
code: aByteArray addr: addr arch: archName
	"This is a bit different to everything we are doing in SmallGrind.
	While normally we do (or intend to do) our own stuff, calling
	external library when Smalltalk still misses something,
	here we are causing a VEX translation *intentionally*."
	| args |
	args := (Dictionary new)
		at: 'data'       put: aByteArray;
		at: 'arch'       put: ((SimState ensureArch: archName) archInfo);
		at: 'mem_addr'   put: addr;
		at: 'opt_level'  put: 0;
		yourself.
	^GenericPyObject create: 'IRSB' constructorNamedArgs: args
