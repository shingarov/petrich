parsing
parseFile: fileName in: path
	^self parse: (path, '/', fileName) asFileReference readStream
