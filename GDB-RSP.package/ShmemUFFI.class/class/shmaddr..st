NB interface to SHM
shmaddr: size
"   NBExecutableAwareGDB shmaddr: 1024000   "
	
	^ self ffiCall: #( void* shmaddr (int size) )
		module: '/home/boris/ppc-hello/HelloNB.so'