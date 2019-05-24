Class {
	#name : #UngroundedEmitTest,
	#superclass : #TestCase,
	#category : 'Petrich-Tests'
}

{ #category : #powerpc }
UngroundedEmitTest >> testMcrf [
	| instruction binary |
	instruction := AcProcessorDescriptions powerpc instructionAt: #mcrf.
	binary := instruction emit. " 010011 ??? 00 ??? 00 00000 0000000000 0 "
	self assert: binary equals: '010011???00???000000000000000000'
]
