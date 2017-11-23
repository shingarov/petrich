API
receive
	| c stream cksum cc |
	"Receive and decode the server's response.
	It may come in chunks on the TCP stream; in that sense, the word Packet may be confusing."
	
	self receiveByte = $$ ifFalse: [ self error: 'Packet does not start with $' ].

	stream := WriteStream with: ''.
	cksum := 0.
	[ c := self receiveChar. c = $# ] whileFalse: [
		cksum := cksum + c asInteger \\ 256.
		c = $* ifTrue: [
			| nChar |
			nChar := self receiveChar asciiValue.
			cksum := cksum + nChar \\ 256.
			nChar - 29 timesRepeat: [ stream nextPut: cc.  ]
		"RLE"
		 ] ifFalse: [ stream nextPut: c. cc := c. ]].
"TODO: escaping"
	self readAndVerifyCksum: cksum.
	socket sendData: '+'. 

	^stream contents
