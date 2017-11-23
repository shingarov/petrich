private
assemblePacket: packetDataString
	| s cksum |
	s := '$', (self escape: packetDataString), '#'.
	cksum := packetDataString  inject: 0 into: [ :soFar :c | soFar + c asciiValue \\ 256 ].
	^s, (cksum printStringBase: 16 nDigits: 2) asLowercase 
