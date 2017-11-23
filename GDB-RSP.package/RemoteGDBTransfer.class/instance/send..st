API
send: aString
	| packet ack n |
	packet := self assemblePacket: aString.
	socket sendData: packet.
	ack := '*'.
	n := socket receiveDataInto: ack.
	ack = '+' ifFalse: [ self error: 'gdb server answered ', ack ].
(Delay forMilliseconds: 50) wait.
