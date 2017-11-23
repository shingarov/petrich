RSP Helpers
vFile
	vFile isNil ifTrue: [ vFile := RemoteGdbVFILE gdb: self ].
	^ vFile