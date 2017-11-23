private
escapeChar: c
	"Where the characters '#' or '$' appear in the packet data,
	they must be escaped.
	The escape character is ASCII 0x7d ('}'),
	and is followed by the original character XORed with 0x20.
	The character '}' itself must also be escaped."
	
	((c == $# or: [c == $$]) or: [c == $}]) ifTrue: [ 
		^String with: $} with: (Character value: (c asciiValue bitXor: 16r20))
	] ifFalse: [ ^String with: c ]