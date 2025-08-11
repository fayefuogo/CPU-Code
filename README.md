# Simple8– An 8-bit CPU in VHDL

Simple8 is a simple, non-pipelined 8-bit CPU built in **VHDL** with a **custom instruction set architecture** (ISA), designed for educational purposes and FPGA implementation.  
This project demonstrates the fundamental components of a CPU, from the arithmetic logic unit (ALU) to control logic, registers, and memory.

## Features
- **8-bit datapath** with custom ISA
- **Non-pipelined** architecture for simplicity and clarity
- Fully modular design (each CPU component in its own VHDL file)
- Accompanied by **testbenches** for each major component
- Synthesizable on common FPGA boards
- Educational focus — great for learning CPU architecture and VHDL

## Project Structure
| File | Description |
|------|-------------|
| `alu.vhd` | Implements arithmetic and logic operations. |
| `alu_tb.vhd` | Testbench for ALU verification. |
| `control_unit.vhd` | Decodes instructions and generates control signals. |
| `control_unit_tb.vhd` | Testbench for control unit. |
| `cpu.vhd` | Top-level CPU entity connecting all modules. |
| `mar.vhd` | Memory Address Register (MAR) implementation. |
| `mem.vhd` | Memory unit for program and data storage. |
| `mem_tb.vhd` | Testbench for memory module. |
| `pc.vhd` | Program Counter implementation. |
| `pc_tb.vhd` | Testbench for program counter. |
| `reg.vhd` | General-purpose registers module. |
| `reg_tb.vhd` | Testbench for register file. |

## Architecture Overview
The CPU follows a **fetch–decode–execute** cycle:
1. **Fetch**: Program Counter (PC) points to instruction in memory.
2. **Decode**: Control Unit interprets the instruction and sets control signals.
3. **Execute**: ALU performs computation or memory access as needed.

**Instruction Set**:
| Opcode | Mnemonic | Syntax       | Description                      |
|--------|----------|--------------|-----------------------------------|
| 0000   | LDA      | LDA [addr]   | Load A from memory at addr.       |
| 0001   | STA      | STA [addr]   | Store A to memory at addr.        |
| 0010   | ADD      | ADD [addr]   | A ← A + M[addr].                   |
| 0011   | SUB      | SUB [addr]   | A ← A − M[addr].                   |
| 0100   | JMP      | JMP [addr]   | PC ← addr.                         |
| 0101   | OUT      | OUT          | Drive A to output port.            |
| 0110   | HLT      | HLT          | Halt the CPU.                      |

## Testing
All major components have dedicated **testbenches** for simulation.
To run simulations:
1. Open the project in ModelSim, GHDL, or your preferred simulator.
2. Compile the `.vhd` source and testbench files.
3. Run simulations and inspect waveforms.

Example:
```bash
ghdl -a alu.vhd alu_tb.vhd
ghdl -r alu_tb --vcd=alu.vcd
