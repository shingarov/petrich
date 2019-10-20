instance creation
value: x
	^self construct: self pythonClassName, ' (', x printString, ')'