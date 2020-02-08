*GDB
postCopy
	super postCopy.
	self setChildren: (self children
		collect: [ :each | each copyWithInclusion ])