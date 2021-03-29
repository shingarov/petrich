tests
testMondrian
	| b nodeList |
	nodeList := self exampleNodes.
	

	b := RSMondrian new.
	b shape box;
		borderColor: (Color black);
		borderWidth: 3;
		color: (Color lightYellow).
	b nodes: nodeList forEach: [ :aCFGENode |
		b shape label color: (Color red).
		b nodes: (OrderedCollection with: aCFGENode @'name').
		b shape label color: (Color black).
		b nodes: aCFGENode linesOfDisassembly.
		b layout vertical.
	].
	b arrowedLine  connectToAll: [ :x | nodeList select: [ :candidateSuccessor | (x @'successors' collect: #addr) includes: candidateSuccessor addr  ]  ].
	"b layout cluster."
	b inspect.
	^b