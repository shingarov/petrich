writing
write: aDictionary to: aStream
	| value bytes |
	value := aDictionary at: self regName.
	bytes := value printStringBase: 16 length: self width // 4 padded: true.
	isLittleEndian ifTrue: [ bytes := bytes reverseInt32Endianness ].
	aStream nextPutAll: bytes