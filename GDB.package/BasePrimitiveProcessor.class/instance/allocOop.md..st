allocating
allocOop: numVars md: md
	|  ptr obj mtNil |
	ptr := self allocSlots: numVars serviceSlots: 3 "header, md, hash".
	obj := MTRemoteObject gdb: gdb pointer: ptr.
	obj header: (TAJObjectWriter
		declareObjectHeaderType: 'OopObjectType'
		hashFormat: 'NoHash'
		numVars: numVars hash: 0 meta: 0).
	obj md: md.
	"nil the slots:"
	mtNil := gdb exe externalReferences at: #MT_nil.
	1 to: numVars do: [ :idx | obj basicSlotAt: idx+2 put: mtNil ].
	^ptr
