general query commands
qSupported
	supported := self q: 'qSupported:swbreak+'.
	supported size == 0 ifFalse: [ | answer ps |
		answer := $; split: supported.
		ps := answer detect: [ :q | q beginsWith: 'PacketSize=' ].
		ps := ps copyFrom: 12 to: ps size.
		packetSize := SmallInteger readFrom: ps base: 16 ]