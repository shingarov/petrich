tests
testSimplestBranchStartBlock
	| proj factory startBlock |
	proj := self openSimplestBranch.
	startAddr := proj at: 'entry'.
	factory := proj at: 'factory'.
	startBlock := factory block: startAddr.
	self playWithStartBlock: startBlock