Class {
	#name : #RewriteResultParser,
	#superclass : #PPCompositeParser,
	#instVars : [
		'instruction',
		'instructionName',
		'operands',
		'emptyOperands',
		'nonEmptyOperands',
		'operand',
		'processorDescription',
		'gprOperand',
		'immediateOperand',
		'decimal'
	],
	#category : 'Petrich-Parsing'
}

{ #category : #'instance creation' }
RewriteResultParser class >> pdl: aProcessorDescription [
	^self new 
		processorDescription: aProcessorDescription 
]

{ #category : #grammar }
RewriteResultParser >> decimal [
	^($- asParser optional, #digit asParser plus) flatten
	==> [ :x | x asInteger ]
]

{ #category : #grammar }
RewriteResultParser >> emptyOperands [
	^'()' asParser 
]

{ #category : #grammar }
RewriteResultParser >> gprOperand [
	^'gpr(' asParser,
	decimal,
	')' asParser ==> [ :x | x second ]
]

{ #category : #grammar }
RewriteResultParser >> immediateOperand [
	^decimal
]

{ #category : #grammar }
RewriteResultParser >> instruction [
	^instructionName, operands ==> [ :x |
		| instructionDefinition  operandValues |
		instructionDefinition := processorDescription instructionAt: x first asSymbol.
		operandValues := x second.
		instructionDefinition bindSequence: operandValues ]
]

{ #category : #grammar }
RewriteResultParser >> instructionName [
	| nonFirstLetter |
	nonFirstLetter := #letter asParser / $_ asParser / $. asParser .
	^(#letter asParser, nonFirstLetter star) flatten
]

{ #category : #grammar }
RewriteResultParser >> nonEmptyOperands [
	^$( asParser,
	operand,
	(($, asParser, operand) ==> [ :x | x second ]) star,
	$) asParser ==> [ :x |
		(OrderedCollection withAll: x third)
			addFirst: (x second);
			yourself
		 ]
]

{ #category : #grammar }
RewriteResultParser >> operand [
	^gprOperand / immediateOperand
]

{ #category : #grammar }
RewriteResultParser >> operands [
	^emptyOperands / nonEmptyOperands
]

{ #category : #'private - access' }
RewriteResultParser >> processorDescription [
	"I am not sure about this.  This is to be able to parametrize the parser,
	but PP insists that each instance variable is a nonterminal production."
	^$z asParser
]

{ #category : #'private - access' }
RewriteResultParser >> processorDescription: aProcessorDescription [
	processorDescription := aProcessorDescription 
]

{ #category : #grammar }
RewriteResultParser >> start [
	"
	(RewriteResultParser pdl: AcProcessorDescriptions mips) parse: '[addu(gpr(1),gpr(20),gpr(5))]'
	"
	^$[ asParser trim,
	instruction,
	($, asParser , instruction) star,
	$] asParser trim ==> [ :x |
		(OrderedCollection withAll: (x third collect: [ :nextInstr | nextInstr second ]))
		addFirst: (x second); yourself ]
]
