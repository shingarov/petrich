instance creation
value: x
	^self construct: 'pyvex.const.', self pythonClassName, ' (', x printString, ')'