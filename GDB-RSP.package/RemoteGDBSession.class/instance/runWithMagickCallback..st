magick
runWithMagickCallback: magicCallbackBlock
	[ true ] whileTrue: [ self runUntilMagick. magicCallbackBlock value ] 