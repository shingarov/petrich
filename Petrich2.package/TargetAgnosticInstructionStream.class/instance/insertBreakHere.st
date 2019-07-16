surgery
insertBreakHere
	breakpointKind == #hard ifTrue: [ ^gdb insertHWBreakpointAt: codePtr ].
	breakpointKind == #trap ifTrue: [ "^gdb insertSWBreakpointAt: codePtr" ^self ].
	self error