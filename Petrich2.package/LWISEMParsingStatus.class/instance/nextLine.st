streaming
nextLine
	| line |
	line := readStream nextLine.
	(line beginsWith: '#') ifTrue: [ ^self nextLine ]. "bogus, leads to inability the last line to be a comment"
	^line