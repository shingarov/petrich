private
nfib
	"long fib(long n) { return n <= 1 ? 1 : fib(n-1) + fib(n-2) + 1; }
	 as compiled by arm-elf-gnuabi-gcc fib.c -c -marm
	also, the jumps are changed by hand."
	"| bat nfib ip |
	bat := GdbARMv8AlienTests new.
	nfib := bat nfib asWordArray.
	ip := 0.
	23 timesRepeat:
		[bat processor disassembleInstructionAt: ip In: nfib into:
			[:da :len|
			Transcript nextPutAll: da; cr; flush.
			ip := ip + len]]"
	^#("           	nfib:
		00" 16rF100041F 		"cmp	x0, 1
		04" 16r540002AD 		"ble	.L4
		08" 16rA9BE53F3 		"stp	x19, x20, [sp, -32]!
		0c" 16rD1000801 		"sub	x1, x0, #2
		10" 16r927FF821 		"and	x1, x1, -2
		14" 16rD1000413 		"sub	x19, x0, #1
		18" 16rA9017BF5 		"stp	x21, x30, [sp, 16]
		1c" 16rD1000C15 		"sub	x21, x0, #3
		20" 16rCB0102B5 		"sub	x21, x21, x1
		24" 16rD2800014 		"mov	x20, 0
			.L3:
		28" 16rAA1303E0 		"mov	x0, x19
		2c" 16rD1000A73 		"sub	x19, x19, #2
		30" 16r97FFFFF4 		"bl	nfib
		34" 16r91000400 		"add	x0, x0, 1
		38" 16r8B000294 		"add	x20, x20, x0
		3c" 16rEB15027F 		"cmp	x19, x21
		40" 16r54FFFF41 		"bne	.L3
		44" 16r91000680 		"add	x0, x20, 1
		48" 16rA9417BF5 		"ldp	x21, x30, [sp, 16]
		4c" 16rA8C253F3 		"ldp	x19, x20, [sp], 32
		50" 16rD65F03C0 		"ret
		54" 16rD503201F 		".p2align 3
			.L4:
		58" 16rD2800020 		"mov	x0, 1
		5c" 16rD65F03C0 		"ret")