RSP commands
setThread: c t: t
	" Hxyyyy family of commands (e.g. Hc-1 or Hg0). "
	| answer |
	answer := self q: 'H', c, t printStringHex.
	answer = 'OK' "ifFalse: [ self error: answer ]" "I've seen this happen in normal operation of the GNU GDB and silently ignored"
