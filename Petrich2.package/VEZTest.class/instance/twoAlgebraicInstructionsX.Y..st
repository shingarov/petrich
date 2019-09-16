tests
twoAlgebraicInstructionsX: x Y: y
	| pdl lis ori |
	pdl := AcProcessorDescriptions powerpc.
	lis := (pdl instructionAt: 'addis') inEnvironment: (Dictionary new 
		at: 'ra' put: 0;
		at: 'rt' put: 3;
		at: 'd' put: x;
		yourself).
	ori := (pdl instructionAt: 'ori') inEnvironment: (Dictionary new
		at: 'rs' put: 3;
		at: 'ra' put: 3;
		at: 'ui' put: y;
		yourself).
	^Array with: lis with: ori