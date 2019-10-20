collaboration with parser
fillLWISEMFrom: aDictionary
	aDictionary keysAndValuesDo: [ :instrName :lwisem |
		(self instructionAt: instrName) semantics dsl: lwisem ]	
