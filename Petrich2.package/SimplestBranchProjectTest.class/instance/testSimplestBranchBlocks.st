tests
testSimplestBranchBlocks
	| proj entry factory startBlock |
	proj := self openSimplestBranch.
	entry := proj at: 'entry'.
	factory := proj at: 'factory'.
	startBlock := factory block: entry.
self shouldBeImplemented 	