tests
testInstantiateLWISEM
	| pdl addis result d |
	pdl := AcProcessorDescriptions powerpc.
	addis := pdl instructionAt: 'addis'.
	result := addis instantiateLWISEM: 'xxx<d>yyy'.
	self assert: (result copyFrom: 1 to: 3) equals: 'xxx'.
	d := result copyFrom: 4 to: (result size - 3).
	"sigh... leaking details of the PyGate here..."
	d := P compute: d.
	self assert: (d isKindOf: IntSymbol).
	self assert: d sym equals: 'd'.
	self assert: d length equals: 16.
	