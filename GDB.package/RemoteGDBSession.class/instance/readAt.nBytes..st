RSP commands
readAt: addr nBytes: n
	| answer stream |
	answer := self q: 'm',
		addr printStringHex,
		',',
		n printStringHex.
	stream := ReadStream on: answer
		from: 1
		to: answer size.
	answer := ByteArray new: n.
	1 to: n do: [ :idx |
		| b |
		b := stream next: 2.
		answer at: idx put: (Integer readFrom: b base: 16) ].
	^answer