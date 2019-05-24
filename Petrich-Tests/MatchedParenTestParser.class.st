Class {
	#name : #MatchedParenTestParser,
	#superclass : #AcCommonParser,
	#category : 'Petrich-Tests'
}

{ #category : #'as yet unclassified' }
MatchedParenTestParser class >> example1 [
	MatchedParenTestParser new parse: 'asdf)'
]

{ #category : #'as yet unclassified' }
MatchedParenTestParser >> start [
	^matchedParen 
]
