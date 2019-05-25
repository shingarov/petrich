API
receiveByte
	| buf1 |
	"Receive exactly one byte, waiting for it if neccesary.
	This is at a level lower than escaping; see #receiveChar for the escaped version."
	buf1 := ByteString new: 1.
	(socket receiveDataInto: buf1) == 1 ifFalse: [GdbChildExited new signal].
	^buf1 first