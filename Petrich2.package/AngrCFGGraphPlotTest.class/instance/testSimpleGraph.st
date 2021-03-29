tests
testSimpleGraph
	| nodeList oneNode insns |
	nodeList := self exampleNodes.
	oneNode := nodeList first.
	insns := oneNode @'block' @'disassembly' @'insns'.
	
	self halt.