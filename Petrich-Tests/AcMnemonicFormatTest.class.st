Class {
	#name : #AcMnemonicFormatTest,
	#superclass : #TestCase,
	#category : 'Petrich-Tests'
}

{ #category : #'as yet unclassified' }
AcMnemonicFormatTest >> forPowerPC [
	^AcMnemonicFormatParser maps: AcProcessorDescriptions powerpc maps
]

{ #category : #'as yet unclassified' }
AcMnemonicFormatTest >> forSPARC [
	^AcMnemonicFormatParser maps: AcProcessorDescriptions sparcv8 maps
]

{ #category : #'as yet unclassified' }
AcMnemonicFormatTest >> testBasic [
	| env parseResult fmt |
	fmt := 'Simple string'.
	parseResult := self forPowerPC parse: fmt.
	env := OrderedCollection new.
	self assert: (parseResult value: env) = fmt
]

{ #category : #'as yet unclassified' }
AcMnemonicFormatTest >> testManySPARC [
	| env parseResult s |
	parseResult := self forSPARC parse: 'Register %reg, %reg, %cond'.
	env := OrderedCollection with: 27 with: 9 with: 5.
	s := parseResult value: env.
	self assert: s = 'Register %i3, %o1, ne'
]

{ #category : #'as yet unclassified' }
AcMnemonicFormatTest >> testOneImm [
	| env parseResult s |
	parseResult := self forPowerPC parse: 'One #%imm imm'.
	env := OrderedCollection with: 5.
	s := parseResult value: env.
	self assert: s = 'One #0x5 imm'
]

{ #category : #'as yet unclassified' }
AcMnemonicFormatTest >> testOneRegPPC [
	| env parseResult s |
	parseResult := self forPowerPC parse: 'Register %reg'.
	env := OrderedCollection with: 2.
	s := parseResult value: env.
	self assert: s = 'Register 2'
]

{ #category : #'as yet unclassified' }
AcMnemonicFormatTest >> testOneRegSPARC [
	| env parseResult s |
	parseResult := self forSPARC parse: 'Register %reg'.
	env := OrderedCollection with: 27.
	s := parseResult value: env.
	self assert: s = 'Register %i3'
]

{ #category : #'as yet unclassified' }
AcMnemonicFormatTest >> testWeirdCharsPPC [
	| env parseResult s |
	parseResult := self forPowerPC parse: 'la %reg, %exp@l(%imm)'.
	env := OrderedCollection with: 2 with: 0 with: 16r555.
	s := parseResult value: env.
	self assert: s = 'la 2, 0x0@l(0x555)'
]
