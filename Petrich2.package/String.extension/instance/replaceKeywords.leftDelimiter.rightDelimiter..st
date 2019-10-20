*Petrich2
replaceKeywords: aBlockOrDictionary  leftDelimiter: ld rightDelimiter: rd
	^aBlockOrDictionary isBlock
		ifTrue: [ self replaceKeywordsUsingBlock: aBlockOrDictionary leftDelimiter: ld rightDelimiter: rd ]
		ifFalse: [ self replaceKeywordsUsingBlock: [ :key |
				aBlockOrDictionary at: key ] leftDelimiter: ld rightDelimiter: rd ]
