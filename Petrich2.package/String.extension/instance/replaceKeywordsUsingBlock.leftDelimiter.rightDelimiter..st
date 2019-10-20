*Petrich2
replaceKeywordsUsingBlock: aBlock leftDelimiter: ld rightDelimiter: rd
	| i j prefix key value rest |
	i := self indexOf: ld ifAbsent: [ ^self ].
	j := self indexOf: rd.
	prefix := self copyFrom: 1 to: i-1.
	key := self copyFrom: i+1 to: j-1.
	value := aBlock value: key.
	rest := self copyFrom: j+1 to: self size.
	^prefix, value, (rest replaceKeywords: aBlock leftDelimiter: ld rightDelimiter: rd)
	