emitting
emit
	" Emit the instruction as a binary string. "
	| currentFormat |
	currentFormat := self format deepCopy.
	^self format bitFields inject: '' into: [ :soFar :field |
		| s |
		s := self stringValueOf: field key usingFormat: currentFormat.
		currentFormat removeFirst.
		soFar, s ]