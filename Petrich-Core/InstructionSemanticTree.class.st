Class {
	#name : #InstructionSemanticTree,
	#superclass : #Object,
	#instVars : [
		'source',
		'instruction',
		'term',
		'let'
	],
	#category : 'Petrich-Core'
}

{ #category : #'instance creation' }
InstructionSemanticTree class >> let: let in: source [
	^self new 
		let: let;
		source: source;
		yourself
]

{ #category : #drawing }
InstructionSemanticTree >> drawLogicOn: aCanvas at: origin [
	"Answer how tall it took."
	| logicStream morph |
	logicStream := WriteStream on: String new.
	self printLogicOn: logicStream.
	morph := TextMorph new
		contents: (logicStream contents);
		fontName: 'Bitmap DejaVu Sans' pointSize: 10;
		backgroundColor: (Color white);
		wrapFlag: true;
		bounds: (origin extent: 550@500);
		enabled: true;
		autoFit: true.
		aCanvas drawMorph: morph.
	^morph bounds extent y
]

{ #category : #drawing }
InstructionSemanticTree >> drawOn: aCanvas at: origin [
	"Answer how tall it took."
	| sourceHeight |
	sourceHeight := self drawSourceOn: aCanvas at: origin.
	^sourceHeight + (self drawLogicOn: aCanvas at: origin + (0@sourceHeight)).
	
]

{ #category : #drawing }
InstructionSemanticTree >> drawSourceOn: aCanvas at: origin [
	"Answer how tall it took."
	| morph |
	morph := TextMorph new
		contents: source;
		fontName: 'Bitmap DejaVu Sans' pointSize: 12;
		backgroundColor: (Color white);
		wrapFlag: true;
		bounds: (origin extent: 500@500);
		enabled: true;
		autoFit: true.
	aCanvas drawMorph: morph.
	^morph bounds extent y
]

{ #category : #accessing }
InstructionSemanticTree >> instruction [
	^ instruction
]

{ #category : #accessing }
InstructionSemanticTree >> instruction: backPtrToInstruction [
	instruction := backPtrToInstruction
]

{ #category : #accessing }
InstructionSemanticTree >> let [
	^ let
]

{ #category : #accessing }
InstructionSemanticTree >> let: anObject [
	let := anObject
]

{ #category : #logic }
InstructionSemanticTree >> printLetOn: aStream [
	let keysAndValuesDo: [ :k :v |
		aStream
			nextPutAll: '  Op';
			nextPutAll: (k printString);
			nextPutAll: ' = '.
		v putOn: aStream.
		aStream
			nextPut: $,;
			cr ]
]

{ #category : #logic }
InstructionSemanticTree >> printLogicOn: aStream [
	term printRewriteHeadOn: aStream.
	aStream nextPutAll: ' => ';
		nextPutAll: instruction name;
		nextPut: $(.
	self printOperandNumbersOn: aStream.
	aStream
		nextPut: $);
		nextPutAll: ' :-';
		lf.
	self printLetOn: aStream.
	term printConditionsOn: aStream instruction: instruction.
	aStream nextPutAll: '  true.'
]

{ #category : #logic }
InstructionSemanticTree >> printOperandNumbersOn: aStream [
	| operandNumbers  |
	operandNumbers := (term addOperandNumbersTo: let keys asSet) sorted collect: [ :n | 'Op', n printString ].
	operandNumbers printUsing: #putOn: on: aStream
]

{ #category : #accessing }
InstructionSemanticTree >> source [
	^ source
]

{ #category : #accessing }
InstructionSemanticTree >> source: anObject [
	source := anObject.
	term := AcSemanticTermParser new parse: source.
]
