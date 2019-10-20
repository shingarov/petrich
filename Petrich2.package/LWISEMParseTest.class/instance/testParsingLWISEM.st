tests
testParsingLWISEM
	| result |
	result := LWISEMParser parseFile: 'lwisem' in: '/Users/boris/PDL/powerpc'.
	result keys includes: 'ori'