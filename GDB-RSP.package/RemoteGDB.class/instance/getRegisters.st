RSP commands
getRegisters
	| answer stream |
	answer := self q: 'g'.
	stream := ReadStream on: answer
		from: 1
		to: answer size.
	^self decodeGPacket: stream