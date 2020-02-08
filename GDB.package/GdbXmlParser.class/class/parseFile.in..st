API
parseFile: fileName in: path
	| f s |
	f := FileStream fileNamed:
		path, '/', fileName.
	s := f contentsOfEntireFile.
	f close.
	^ self new parseString: s