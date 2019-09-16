as yet unclassified
host: h port: p
	| socket |
	socket := Socket newTCP 
		setOption: 'TCP_NODELAY' value: 1;
		connectTo: (NetNameResolver addressForName: h) port: p.
	^self onSocket: socket