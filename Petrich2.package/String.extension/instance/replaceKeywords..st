*Petrich2
replaceKeywords: aBlockOrDictionary
	^aBlockOrDictionary isBlock
		ifTrue: [ self replaceKeywordsUsingBlock: aBlockOrDictionary ]
		ifFalse: [ self replaceKeywordsUsingBlock: [ :key | aBlockOrDictionary at: key ] ]
