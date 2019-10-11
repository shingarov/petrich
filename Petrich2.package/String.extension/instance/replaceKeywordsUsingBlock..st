*Petrich2
replaceKeywordsUsingBlock: aBlock
	| i j prefix key value rest |
	i := self indexOf: $< ifAbsent: [ ^self ].
	j := self indexOf: $>.
	prefix := self copyFrom: 1 to: i-1.
	key := self copyFrom: i+1 to: j-1.
	value := aBlock value: key.
	rest := self copyFrom: j+1 to: self size.
	^prefix, value, (rest replaceKeywords: aBlock)
	