allocating
allocString: size md: md
	| ptr obj |
	ptr := self allocSlots: (size + 2 + 3 // 4) serviceSlots: 3 "header, md, hash".
	obj := MTRemoteObject gdb: gdb pointer: ptr.
	obj header: (TAJObjectWriter
		declareObjectHeaderType: 'ZByteObjectType'
		hashFormat: 'StringHash'
		numVars: size
		hash: 0
		meta: 0).
	obj md: md.
	self return: ptr