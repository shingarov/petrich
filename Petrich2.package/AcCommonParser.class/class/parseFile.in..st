API
parseFile: fileName in: path
	| f s |
	f := FileStream fileNamed:
		path,
		'/',
		fileName.
	s := f contentsOfEntireFile.
	f close.
	s := AcCommentStripper strip: s.
	^(self inWorkingDirectory: path)
		parse: s