fonts
fieldFont: stringToFit in: width
	| pointSize font |
	pointSize := 10.
	[ font := LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: pointSize.
	(font widthOfString: stringToFit) < width or: [ pointSize <= 8 ] ] whileFalse: [ pointSize := pointSize - 1 ].
	^font