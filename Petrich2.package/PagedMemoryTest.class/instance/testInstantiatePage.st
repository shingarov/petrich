tests
testInstantiatePage
	| page |
	page := RAMPage
		contents: #[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16]
		startAddr: 256
		permissions: 2r001.
	self assert: (page isKindOf: RAMPage).
	self assert: page @'concrete_permissions'  equals: 2r001.
	self assert: page @'_page_size' equals: 16.
	self assert: (page load_mo: nil page_idx: 256+1) equals: 2.
