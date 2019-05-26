general query commands
packetSize
	packetSize isNil ifTrue: [ 
		| ps |
		ps := supported detect: [ :q | q beginsWith: 'PacketSize=' ].
		ps := ps copyFrom: 12 to: ps size.
		packetSize := SmallInteger readFrom: ps base: 16 ].
	^packetSize 