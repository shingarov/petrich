drawing
drawField: fieldName on: aCanvas left: left right: right
	| x string  font width |
	string := fieldName asString. "could be the SmallInteger 0; see #testMCRF"
	(instruction internalBindings includesKey: fieldName) ifTrue: [ 
		string := fieldName, '=', (instruction internalBindings at: fieldName) asString ].
	font := self fieldFont: string in: right - left.
	width := font widthOfString: string.
	x := left + right - width // 2.
	aCanvas
		drawString: string 
		at: x @ (self bitBox top + 3)
		font: font
		color: Color black