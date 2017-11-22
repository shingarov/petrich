grammar
assemblerComment
	^('assembler.set_comment' asParser / 'assembler.set_line_comment' asParser) trim,
	matchedParen trim,
	';' asParser trim
	==> [ :x | 'assembler_comment' -> #() ]