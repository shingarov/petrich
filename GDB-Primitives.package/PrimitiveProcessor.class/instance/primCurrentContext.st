control primitives
primCurrentContext
	| context  |
	context := self currentFrame senderFrame.
	self return: (context pointer bitOr: 3)