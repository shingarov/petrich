drawing
drawSourceOn: aCanvas at: origin
	"Answer how tall it took."
	| morph |
	morph := TextMorph new
		contents: source;
		fontName: 'Bitmap DejaVu Sans' pointSize: 12;
		backgroundColor: (Color white);
		wrapFlag: true;
		bounds: (origin extent: 500@500);
		enabled: true;
		autoFit: true.
	aCanvas drawMorph: morph.
	^morph bounds extent y