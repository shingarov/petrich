grammar
decimal
	^($- asParser optional, #digit asParser plus) flatten
	==> [ :x | x asInteger ]