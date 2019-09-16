API
receiveChar
	"Receive the next char from the TCP stream."

	| byte |
	byte := self receiveByte.
	"Do NOT escape at this level; check for RLE, and then escaping is above."
	^byte