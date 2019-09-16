tests
testRdTmp
	| rdTmp reRead |
	rdTmp := VexRdTmp tmpNo: 3.
	reRead := P fetchVar: rdTmp var.
	self assert: reRead tmp equals: 3