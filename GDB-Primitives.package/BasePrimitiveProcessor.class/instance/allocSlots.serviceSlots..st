allocating
allocSlots: numSlots serviceSlots: s
	| nBytes p |
	false ifTrue: [ ^self allocSlotsFromMTXMemory: numSlots ].
	
	nBytes := (numSlots + s) * 4.
	nBytes := nBytes+15 bitAnd: 16rFFFFFFF0.
	p := self getVRegister: #HEAP.
	self setVRegister: #HEAP to: p + nBytes.
	^p