tests
testPagedRAMwithPage
	| page pagedRAM |
	page := RAMPage
		contents: #[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16]
		startAddr: 512
		permissions: 2r001.
	pagedRAM := SimPagedMemory with: page state: nil.
	self assert: page @'concrete_permissions'  equals: 2r001.
	self assert: page @'_page_size' equals: 16.
	"byte at offset 1"
	self assert: (pagedRAM __getitem__: 512+1) equals: 2.
	"another way to say it, get it from the page"
	self assert: (page load_mo: nil page_idx: 512+1) equals: 2.
