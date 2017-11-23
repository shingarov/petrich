private
escape: aString
	^aString inject: '' into: [ :soFar :c | soFar, (self escapeChar: c) ].
	