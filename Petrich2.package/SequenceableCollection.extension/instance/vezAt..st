*Petrich2
vezAt: addr
	" This method should not be here.
	The receiver is a sequence of CPU instructions starting at address addr.
	Lift them and answer the resulting VEZ.  "
	| empty pc |
	pc := addr - 4.
	empty := IRSB emptyAt: addr arch: self first isa architectureName.
	^self inject: empty into: [ :soFar :anInstruction |
		soFar, (anInstruction vezAt: (pc := pc+4)) ]