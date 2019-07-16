An ISA defines several "instruction formats" consisting of a plurality of "bit fields".
Each processor instruction is encoded according to one of these formats.
For example, the "ori ra, rs, #imm" instruction in the PowerPC ISA is encoded according to the D4 format, which consists of 4 bit fields:
opcd:6,
rs:5,
ra:5,
ui:16.
