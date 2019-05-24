Class {
	#name : #AcIsaStatementParseTest,
	#superclass : #TestCase,
	#category : 'Petrich-Tests'
}

{ #category : #tests }
AcIsaStatementParseTest >> parseStatement: aString [
	| result |
	result := AcIsaParser new
		parse: 'AC_ISA(test) { ', aString, ' };'.
	^result first

]
