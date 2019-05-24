Class {
	#name : #Pharo2beeClassFileout,
	#superclass : #Object,
	#instVars : [
		'stream',
		'author',
		'project'
	],
	#category : 'Petrich-DUI'
}

{ #category : #examples }
Pharo2beeClassFileout class >> example1 [
	" Pharo2beeClassFileout halt; example1 "
	Pharo2beeClassFileout
		fileOut: Integer 
		author: 'B Shingarov'
		project: 'Petrich-Tests'
]

{ #category : #examples }
Pharo2beeClassFileout class >> example2 [
	" Pharo2beeClassFileout example2 "
	| stream |
	stream := (String new: 1000) writeStream.
	SystemOrganization
		beeOutCategory: 'GDB-UI' on: stream.
]

{ #category : #API }
Pharo2beeClassFileout class >> fileOut: aClassDescription author: author project: project [
	| stream |
	stream := (String new: 1000) writeStream.
	self new
		stream: stream;
		author: author;
		project: project;
		fileOut: aClassDescription.
	FileStream writeSourceCodeFrom: stream baseName: aClassDescription name isSt: true
]

{ #category : #accessing }
Pharo2beeClassFileout >> author [
	^ author
]

{ #category : #accessing }
Pharo2beeClassFileout >> author: anObject [
	author := anObject
]

{ #category : #'file in/out' }
Pharo2beeClassFileout >> fileOut: aClassDescription [
	| ts |
	ts := '  timeStamp: ''2017-01-01T00:00:01.000-05:00'''.
	stream
		nextPutAll: '!ClassDefinition'; cr;lf;
		nextPutAll: ts; cr;lf;
		nextPutAll: '  author: '''; nextPutAll: (self author); nextPut: $'; cr;lf;
		nextPutAll: '  className: '''; nextPutAll: (aClassDescription name asString); nextPut: $'; cr;lf;
		nextPutAll: '  project: '''; nextPutAll: (self project); nextPut: $'; cr;lf;
		nextPut: $!; cr;lf;
		nextChunkPut: (aClassDescription definition); cr;lf.
	
	"Methods"
	self
		fileOutMethodsOf: aClassDescription;
		fileOutMethodsOf: aClassDescription class
]

{ #category : #'file in/out' }
Pharo2beeClassFileout >> fileOutMethod: sel ofClass: aClassDescription [
	| ts sourceCode |
	ts := '  timeStamp: ''2017-01-01T00:00:01.000-05:00'''.
	stream
		nextPutAll: '!MethodDefinition'; cr;lf;
		nextPutAll: ts; cr;lf;
		nextPutAll: '  author: '''; nextPutAll: (self author); nextPut: $'; cr;lf;
		nextPutAll: '  className: '''; nextPutAll: (aClassDescription name asString); nextPut: $'; cr;lf;
		nextPutAll: '  selector: '; nextPutAll: (sel printString); cr;lf;
		nextPutAll: '  category: '; nextPutAll: ((aClassDescription organization categoryOfElement: sel) printString); cr;lf;
		nextPutAll: '  project: '''; nextPutAll: (self project); nextPut: $'; cr;lf;
		nextPut: $!; cr;lf.
	sourceCode := (aClassDescription >> sel) sourceCode.
	self stream nextChunkPut: sourceCode; cr;lf


]

{ #category : #'file in/out' }
Pharo2beeClassFileout >> fileOutMethodsOf: aClassDescription [
	aClassDescription organization allMethodSelectors do: [ :sel | self fileOutMethod: sel ofClass: aClassDescription ]
]

{ #category : #accessing }
Pharo2beeClassFileout >> project [
	^ project
]

{ #category : #accessing }
Pharo2beeClassFileout >> project: anObject [
	project := anObject
]

{ #category : #accessing }
Pharo2beeClassFileout >> stream [
	^ stream
]

{ #category : #accessing }
Pharo2beeClassFileout >> stream: anObject [
	stream := anObject
]
