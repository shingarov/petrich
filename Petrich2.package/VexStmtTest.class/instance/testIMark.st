tests
testIMark
	| iMark |
	iMark := VexIMark addr: 16r100 len: 4 delta: 0.
	self assert: iMark addr equals: 16r100.
	self assert: iMark len equals: 4.
	self assert: iMark delta equals: 0.
