tests
playWithStartBlock: b
	self playWithCapstone: b @'capstone'.
	self assert: b @'instructions' equals: 2.
	self playWithIRSB: b @'vex'
	