drawing
drawLogicOn: aCanvas at: origin
	"Answer how tall it took."
	| logicStream morph |
	logicStream := WriteStream on: String new.
	self printLogicOn: logicStream.
	morph := TextMorph new
		contents: (logicStream contents);
		fontName: 'Bitmap DejaVu Sans' pointSize: 10;
		backgroundColor: (Color white);
		wrapFlag: true;
		bounds: (origin extent: 550@500);
		enabled: true;
		autoFit: true.
		aCanvas drawMorph: morph.
	^morph bounds extent y