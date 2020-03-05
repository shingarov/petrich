I provide the ability to use the Python ArchInfo library.

Placing this in MachineArithmetic is illogical and will be reorganized in the near future.  The reason we do it like this for now, is that we need solvers for algebra, and for simplicity we don't distinguish between angr solvers (which we get from SimStates, and therefore we need a CPU architecture) and Z3 solvers.