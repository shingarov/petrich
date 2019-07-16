grammar
percentId
	| p |
	p := imm.
	self class maps keysAndValuesDo: [ :mapName :map |
		p := p / (('%', mapName) asParser / ('%[', mapName, ']') asParser ==>
		[ :r | [ :operands :stream | stream nextPutAll: (map at: (operands removeFirst)) ]])].
	^ p