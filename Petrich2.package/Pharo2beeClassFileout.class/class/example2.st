examples
example2
	" Pharo2beeClassFileout example2 "
	| stream |
	stream := (String new: 1000) writeStream.
	SystemOrganization
		beeOutCategory: 'GDB-UI' on: stream.