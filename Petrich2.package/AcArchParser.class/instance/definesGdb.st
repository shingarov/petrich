grammar
definesGdb
	^'defines_gdb("' asParser,
	$" asParser negate star flatten,
	'");' asParser
	==> [ :x | 'defines_gdb' ->  (AcDefinesParser parseFile: x second in: directory) ]