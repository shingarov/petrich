instance creation
arch: archName
	"Instantiate a new symbolic simulation state.
	The design of this will change in the future,
	because it is illogical to need a whole machine state
	(knowing the PDL etc) to just create a bit vector."
	| args |
	args := Dictionary new
		at: 'arch' put: (ArchInfo arch: archName);
		at: 'mode' put: 'symbolic';
		yourself.
	^GenericPyObject create: 'angr.SimState' constructorNamedArgs: args