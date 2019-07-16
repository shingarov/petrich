grammar
instructionName
	| nonFirstLetter |
	nonFirstLetter := #letter asParser / $_ asParser / $. asParser .
	^(#letter asParser, nonFirstLetter star) flatten