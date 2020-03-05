crap
arch: archName
	"Instantiate a new symbolic simulation state.
	The design of this will change in the future,
	because it is illogical to need a whole machine state
	(knowing the PDL etc) to just create a bit vector."
	
	| knownArchinfo |
	knownArchinfo := ArchInfo knownArchinfos at: archName.
	^P compute: 'archinfo.', knownArchinfo