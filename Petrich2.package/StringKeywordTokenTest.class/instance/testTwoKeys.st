tests
testTwoKeys
	| d result |
	d := Dictionary new
		at: 'x' put: 'XXX';
		at: 'y' put: 'YYY';
		yourself.
	result := '<x>abcd<y>' replaceKeywords: d.
	self assert: result equals: 'XXXabcdYYY'