accessing
instruction: backPtrToInstruction
	instruction := backPtrToInstruction.
	trees do: [ :aSemanticTree | aSemanticTree instruction: backPtrToInstruction ]