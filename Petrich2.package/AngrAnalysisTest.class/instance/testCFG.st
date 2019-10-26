test mock
testCFG
	| p cfg |
	p := self readElf .
	cfg := P compute: p ref, '.analyses.CFGFast()'.
	
	cfg halt 