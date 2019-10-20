instance creation
emptyAt: anInteger arch: isaNameString 
	| archRef |
	archRef := (SimState now at: 'arch') ref.
	^P compute: 'IRSB.empty_block(', archRef, ', 0x100)'