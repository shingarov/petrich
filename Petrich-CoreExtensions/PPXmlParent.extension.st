Extension { #name : #PPXmlParent }

{ #category : #'*Petrich-CoreExtensions' }
PPXmlParent >> postCopy [
	super postCopy.
	self setChildren: (self children
		collect: [ :each | each copyWithInclusion ])
]
