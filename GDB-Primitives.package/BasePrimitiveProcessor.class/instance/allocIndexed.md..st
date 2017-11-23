allocating
allocIndexed: size md: md
	|  ptr obj liveObj mtNil |
	ptr := self allocSlots: size serviceSlots: 3.
	obj := MTRemoteObject gdb: gdb pointer: ptr.
	obj header: (TAJObjectWriter
		declareObjectHeaderType: 'IndexedObjectType'
		hashFormat: 'NoHash'
		numVars: size
		hash: 0
		meta: 0).
	obj md: md.
	liveObj := MTRemoteLiveIndexedObject gdb: gdb pointer: ptr.
	mtNil := gdb exe externalReferences at: #MT_nil.
	1 to: size do: [ :i |
		liveObj mtAt: i put: mtNil ].
	self return: ptr