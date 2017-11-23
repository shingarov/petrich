magick
runStepsWithMagickCallback: magicCallbackBlock
	[ true ] whileTrue: [ self stepUntilMagick. magicCallbackBlock value ] 