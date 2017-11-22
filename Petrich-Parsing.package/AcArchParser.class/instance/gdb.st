grammar
gdb
	^'ac_gdb("' asParser,
	$" asParser negate star flatten,
	'");' asParser
	==> [ :x | 'ac_gdb' ->  (GdbXmlParser parseFile: x second in: directory) ]