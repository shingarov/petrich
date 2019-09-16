control primitives
primPerform
	"Perform a 0-arg send.
	Receiver in R, selector in A."
	| a selector fp frame jmpTarget |

	a := self getVRegister: #A.
	fp := self getVRegister: #FP.
	frame := MTRemoteStackFrame gdb: gdb pointer: fp.
	self setVRegister: #SP to: fp-4.
	self setVRegister: #FP to: frame senderFrame pointer.
	
	selector := MTRemoteSymbol gdb: gdb pointer: a.
	jmpTarget := (HostAssistedLookup regBase: self ram: gdb) messageSendSelector: selector symbol.
	"jmpTarget := gdb messageSendSelector: selector symbol."  "correct address to jump to in CTR!"
	"but the contract with the primitive invocation code is that
	the address is in scratch1."
	self setVRegister: #Scratch1 to: jmpTarget 
	
	