API
processor: processorName in: path
	| f s |
	f := FileStream fileNamed:
		path,
		'/',
		processorName,
		'.ac'.
	s := f contentsOfEntireFile.
	f close.
	s := AcCommentStripper strip: s.
	^(self inWorkingDirectory: path)
		processorName: processorName;
		parse: s