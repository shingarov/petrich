parsing
parseFile: fileName in: path ifNoFile: aBlock
	| stream |
	stream := [(path, '/', fileName) asFileReference readStream]
		on: FileDoesNotExistException
		do: aBlock.
	^self parse: stream