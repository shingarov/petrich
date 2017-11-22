grammar
id
	^(#letter asParser, ($_ asParser / #word asParser) star) flatten