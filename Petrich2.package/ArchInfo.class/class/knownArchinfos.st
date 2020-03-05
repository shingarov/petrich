crap
knownArchinfos
	^Dictionary new
		at: 'powerpc' put: 'ArchPPC32(archinfo.Endness.BE)';
		at: 'arm'     put: 'ArchARM(archinfo.Endness.LE)';
		at: 'mips'    put: 'ArchMIPS32(archinfo.Endness.BE)';
		at: 'IA32'    put: 'ArchX86(archinfo.Endness.LE)';
		yourself 
		"We don't have ArchC models for these:
			ArchAMD64,
			ArchAArch64,
			ArchPPC64,
			ArchMIPS64,
			ArchSoot,
			ArchS390X.
		 We don't have ArchInfo for these:
			riscv,
			sparc (ArchC models v8)
		"
