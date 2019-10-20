tests
testInstantiateLWISEMConcrete
	| pdl addis result d |
	pdl := AcProcessorDescriptions powerpc.
	addis := pdl instructionAt: 'addis'.
	addis := addis inEnvironment: (Dictionary new 
		at: 'rt' put: 1;
		at: 'ra' put: 2;
		at: 'd' put: 5;
		yourself ).
	result := addis instantiateLWISEM: 'xxx<d>yyy'.
	self assert: (result copyFrom: 1 to: 3) equals: 'xxx'.
	d := result copyFrom: 4 to: (result size - 3).
	"sigh... leaking details of the PyGate here..."
	d := P compute: d.
	self assert: (d isKindOf: IntValue).
	self assert: d value equals: 5.
	self assert: d length equals: 16.
	