I represent the pre-solved I/O effect equation for a number of parametrized solution families.

At the JIT synthesis time, a number of IR tree fragments, or "idioms", are considered and the native instruction sequences are constructed for them, parametrized by some operands.  For example, PushR is an idiom.  These native sequences are stored in an IdiomaticInstructionSelector object (only one for a particular JIT, but you will need to construct a different one for a different ISA, or for a different idiom set).

At runtime, when the idiom 'IdiomName' is encoutered with operands op1, op2, sending 

anIIS emitIdiom: 'IdiomName' with: op1 with:  op2: 

will look up the idiom, resulting in a two-argument block; that block is sent #value:value:, resulting in a SequenceableCollection of fully-grounded processor instructions.  For the programmer's convenience, these are then assembled into binary and the resulting sequence of binary instructions is returned.

Note that the actual semantics are completely opaque at this level.

Note also that certain parameters are part of synthesis; for example, PushR operates on two register specs: which register to push, and which register is the SP.  However, the SP knowledge is fully dealt with at the synthesis phase, so the idiom only takes one operand (R).

