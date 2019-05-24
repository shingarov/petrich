Extension { #name : #PPXmlElement }

{ #category : #'*Petrich-CoreExtensions' }
PPXmlElement >> baseURI [
	^self parent baseURI  "FIXME"
]

{ #category : #'*Petrich-CoreExtensions' }
PPXmlElement >> copyWithInclusion [
	" Answer a copy of myself, performing the XInclude inclusion transformation. "
	self name qualifiedName = 'xi:include' ifTrue: [
		| href |
		href := self attributeAt: 'href' ifAbsent: [self error].
		^self baseURI get: href.
	] ifFalse: [ ^self copy ]. "Not an include"
	
]
