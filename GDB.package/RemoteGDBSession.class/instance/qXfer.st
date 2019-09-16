RSP Helpers
qXfer
	qXfer isNil ifTrue: [ qXfer := RemoteGdbXFER gdb: self ].
	^ qXfer