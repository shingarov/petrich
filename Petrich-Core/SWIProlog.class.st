Class {
	#name : #SWIProlog,
	#superclass : #Object,
	#instVars : [
		'processorDescription'
	],
	#category : 'Petrich-Core'
}

{ #category : #'file paths' }
SWIProlog class >> pigCanDigFileName [
	^'/home/boris/pig.pl'
]

{ #category : #'file paths' }
SWIProlog class >> swipl [
	^'/usr/bin/swipl'
"	^'/Applications/SWI-Prolog.app/Contents/MacOS/swipl'  "
]

{ #category : #'code generation' }
SWIProlog >> command [
	^self class swipl,
	' -s /home/boris/PIG/taj_top.pl -g solve_idioms -t halt 2>/dev/null'
]

{ #category : #'code generation' }
SWIProlog >> solveS [
	"Answer the string defining the Dictionary of idioms
	in the SInv Idiom Language.  This string can be fed
	into SInvParser to obtain the idiomName->Block dictionary."
	" SWIProlog new solveS "
	| answer |
	answer := (PipeableOSProcess command: self command) output.
	answer := answer reject: [ :char | char = $_ ].
	^answer
]
