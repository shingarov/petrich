*GDB-RSP
reverseInt32Endianness
	" Assume the I consist of exactly 8 hex digits representing a 32-bit integer.
	Answer the 8-digit string in reverse byte order.
	For example. 0102ABCD becomes CDAB0201."
	
	| s rev |
	s := ReadStream on: self.
	rev := ''.
	4 timesRepeat: [ rev := (s next: 2), rev ].
	^rev