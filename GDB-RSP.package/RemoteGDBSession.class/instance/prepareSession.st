RSP commands
prepareSession
	self qSupported.
	self setThread: 'g' t: 0.
	self qStatus = '' ifFalse: [ self error: 'Bad status' ].
	self vCont.
	self askFeatures.
"Source says that Hc is deprecated in favor of vCont."
"	self setThread: 'c' t: -1. "

"	self qTStatus.
	self why"