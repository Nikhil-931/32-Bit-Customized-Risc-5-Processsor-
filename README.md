# 32-Bit-Customized-Risc-5-Processsor

This project aims for the implementation of 32 bit RISC 5 processor with the help of following instruction formats ;
R-type,
I-type,
S-type,
B-type.
According to Risc Architecture, there are several steps such as instruction fetching ,decoding ,executing and controlling the process using control unit for executing each of the instruction.

Each of these actions are specified in separate modules , and they are integrated in a top module and operated sequentially. The modules specified are
Control_source
mem_re
pc(program counter)
instruction_decoderr
register
alu(Arithmetic and logical unit).

control_source module is responsible for giving enable signal of all other modules sequentially.

Initially program counter is enabled .

This module caculates the address of the instrucrtion to be fetched from the memory.

this is then passed to mem_re module.

now mem_re module passes the instruction specified by address to the instuction decoder module.

Instruction decoder decodes the instuction recieved and divides the instruction into opcode ,address of source registers.

The address are paased to reg_re module.

Reg_re module has Register and is capable of reading and writing into the Register.

now reg_re module reads the values in register using the address recieved.

These values are given to arithmetic and logical unit where the required operation is performed.

now the result obtained from alu is stored in register.

If there is requirement the result is also stored in memory by using store instruction.

The data in memory can also be loaded into register by using load instruction.


The size of memory is 32*2048 which is 128 KB.
The size of register is 32*32 which is 2048 bytes.
