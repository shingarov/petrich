grammar
isa
	^'ac_isa("' asParser,
	$" asParser negate star flatten,
	'");' asParser
	==> [ :x | 'ac_isa' ->  (AcIsaParser parseFile: x second in: directory) ]