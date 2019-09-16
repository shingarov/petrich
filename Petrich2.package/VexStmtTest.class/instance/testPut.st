tests
testPut
	| p rd |
	rd := VexRdTmp tmpNo: 1.
	p := VexPUT expr: rd gprOffset: 28.
	self assert: p tag equals: 'Ist_Put'.
	self assert: p data tmp equals: 1.
	self assert: p offset equals: 28.
