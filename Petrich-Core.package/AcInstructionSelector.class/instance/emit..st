code emitting
emit: anAbstractTerm
	| f result emittedInstructions |
self halt.
	[FileSystem disk delete: SWIProlog pigCanDigFileName] on: FileDoesNotExist do: [  ].
	f := FileStream newFileNamed: SWIProlog pigCanDigFileName.
	self printLogicOn: f.
	self printGoGoal: anAbstractTerm on: f.
	f close.
	result := SWIProlog new emit.
	emittedInstructions := (RewriteResultParser pdl: self) parse: result.
	^self assembleBinary: emittedInstructions