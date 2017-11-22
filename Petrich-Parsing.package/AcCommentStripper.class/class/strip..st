API
strip: sourceString
	"Return sourceString with comments stripped."
	^self stripSlashStar: (self stripSlashSlash: sourceString)