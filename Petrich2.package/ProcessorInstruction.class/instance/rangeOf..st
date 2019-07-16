access
rangeOf: fieldName
	"Answer the interval of bit-positions of the requested field."
	| start stop |
	start := format positionOf: fieldName.
	stop := start + 1 - (format widthOf: fieldName).
	^Interval from: start to: stop by: -1