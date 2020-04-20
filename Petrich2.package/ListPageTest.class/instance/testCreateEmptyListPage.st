tests
testCreateEmptyListPage
	| page |
	page := RAMPage startAddr: 10000 size: 32.
	self assert: page @'_page_size' equals: 32