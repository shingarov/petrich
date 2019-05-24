"
I parse the AccGen compiler_info.ac files.
"
Class {
	#name : #AcCompilerInfoParser,
	#superclass : #AcCommonParser,
	#instVars : [
		'semanticTree',
		'semantic',
		'let',
		'idN',
		'letOpDefinition',
		'letOpDefinitions',
		'compilerInfo',
		'defineOperand',
		'defineOperator',
		'defineRegisters',
		'redefineOperand',
		'abi',
		'treeRewrite',
		'semanticFragment'
	],
	#category : 'Petrich-Parsing'
}

{ #category : #'grammar-abi' }
AcCompilerInfoParser >> abi [
	^AcAbiParser new
	==> [ :x | 'abi' -> x ]
]

{ #category : #grammar }
AcCompilerInfoParser >> compilerInfo [
	^semantic /
	defineOperator /
	defineOperand /
	defineRegisters /
	redefineOperand /
	abi /
	treeRewrite /
	semanticFragment 
]

{ #category : #'grammar-registers' }
AcCompilerInfoParser >> defineOperand [
	^'define operand' asParser trim,
	$; asParser negate star,
	$; asParser
	==> [ :x | 'operand' -> x ]
]

{ #category : #'grammar-machine specific' }
AcCompilerInfoParser >> defineOperator [
	^'define operator' asParser trim,
	$; asParser negate star,
	$; asParser
	==> [ :x | 'operator' -> x ]
]

{ #category : #'grammar-registers' }
AcCompilerInfoParser >> defineRegisters [
	^'define registers' asParser trim,
	id,
	$: asParser,
	id,
	#space asParser star,
	'as' asParser trim,
	$( asParser trim,
	registerListSpaceSeparated,
	');' asParser trim
	==> [ :x | 'registers' -> x ]
]

{ #category : #'grammar-semantics' }
AcCompilerInfoParser >> let [
	^'let' asParser trim,
	letOpDefinitions,
	'in' asParser trim ==> [ :x |
		| answer |
		answer := Dictionary new.
		x second do: [ :aLet |
				answer at: aLet key put: aLet value ].
		answer ]
]

{ #category : #'grammar-semantics' }
AcCompilerInfoParser >> letOpDefinition [
	^idN trim,
	$= asParser trim,
	$" asParser,
	$" asParser negate star flatten,
	$" asParser ==> [ :x | x first second -> x fourth ]
]

{ #category : #'grammar-semantics' }
AcCompilerInfoParser >> letOpDefinitions [
	^letOpDefinition,
	($, asParser trim, letOpDefinition) star
	==> [ :x |
		| answer |
		answer := OrderedCollection with: x first.
		x second do: [ :y | answer add: y second ].
		answer ]
]

{ #category : #'grammar-abi' }
AcCompilerInfoParser >> redefineOperand [
	^'redefine operand tgtimm size to ' asParser,
	positiveNumber,
	$; asParser
	==> [ :x | 'tgtimm_size' -> x second ]
]

{ #category : #'grammar-semantics' }
AcCompilerInfoParser >> semantic [
	"The semantic forest of an instruction.
	Parses into 'semantic'->(instructionName->InstructionSemantic(ArrayOfSemanticTrees, cost, hasDelaySlot)).
	"
	^'define instruction ' asParser,
	id,
	' semantic as (' asParser,
	(semanticTree trim ==> [ :x | InstructionSemanticTree let: x first in: x second ]) star,
	')' asParser trim,
	'cost' asParser trim,
	number,
	', has_delay_slot' asParser optional,
	';' asParser
	==> [ :x | 'semantic' -> (x second -> (InstructionSemantic  
		trees: x fourth
		cost: x seventh
		hasDelaySlot: (x at: 8) notNil
	))]
]

{ #category : #'grammar-semantics' }
AcCompilerInfoParser >> semanticFragment [
	^'define semantic fragment' asParser trim,
	id,
	'as' asParser trim,
	matchedParen,
	$; asParser
	==> [ :x | 'fragment' -> x ]
]

{ #category : #'grammar-semantics' }
AcCompilerInfoParser >> semanticTree [
	^let optional, matchedParen , $; asParser
	==> [ :x | Array
		with: (x first isNil ifTrue: [Dictionary new] ifFalse: [x first])
		with: x second ]

]

{ #category : #grammar }
AcCompilerInfoParser >> start [
	^compilerInfo trim star end
]

{ #category : #'grammar-machine specific' }
AcCompilerInfoParser >> treeRewrite [
	^matchedParen trim,
	'=>' asParser trim,
	matchedParen trim,
	$; asParser
	==> [ :x | 'treeRewrite' -> x ]
]
