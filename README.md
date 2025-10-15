# Pipelined MIPS Processor with Hazard Control

A fully functional 32-bit MIPS processor implementation featuring five-stage pipelining with comprehensive hazard detection and mitigation mechanisms. Deployed and verified on Xilinx Nexys 3 (Spartan-6 FPGA).

##  Project Overview

This project implements a classic RISC pipeline with explicit hazard handling, demonstrating fundamental computer architecture concepts including data forwarding, stall insertion, and branch flush control. The design prioritizes instruction throughput while maintaining timing closure constraints on resource-limited FPGAs.

##  Architecture

### Five-Stage Pipeline
```
IF (Instruction Fetch) → ID (Instruction Decode) → EX (Execute) → 
MEM (Memory Access) → WB (Write Back)
```

### Key Features
- **32-bit datapath** with full MIPS instruction subset support
- **Explicit inter-stage registers** for pipeline separation
- **Hazard detection unit** for RAW (Read After Write) and WAR (Write After Read) conflicts
- **Forwarding network** to minimize stall cycles
- **Branch flush logic** to handle control hazards
- **Seven-segment display interface** for real-time ALU state visualization

##  Hazard Mitigation Strategies

### Data Hazards
- **RAW Detection**: Monitors register dependencies across pipeline stages
- **Forwarding Paths**: EX/MEM → EX and MEM/WB → EX bypass paths
- **Stall Insertion**: Automatic pipeline stall for load-use hazards
- **WAR Handling**: Register renaming and write-back ordering

### Control Hazards
- **Branch Prediction**: Static not-taken prediction
- **Flush Mechanism**: Invalidates instructions in IF/ID stages on misprediction
- **Branch Penalty Mitigation**: Early branch resolution in ID stage (where possible)

##  Design Specifications

| Parameter | Value |
|-----------|-------|
| **Word Size** | 32-bit |
| **Pipeline Stages** | 5 (IF/ID/EX/MEM/WB) |
| **Target FPGA** | Xilinx Spartan-6 (XC6SLX16) |
| **Clock Frequency** | ~50 MHz (timing-driven synthesis) |
| **Instruction Set** | MIPS subset (R-type, I-type, load/store, branches) |
| **Register File** | 32 × 32-bit registers |

## 🛠️ Implementation Details

### HDL & Tools
- **Language**: Verilog HDL
- **Synthesis**: Xilinx Vivado / ISE 14.7
- **Simulation**: ModelSim
- **Verification**: Directed tests + pseudo-random instruction sequences



##  On-Board Debug Features

The Nexys 3 deployment includes:
- **Seven-segment anodes**: Display current instruction opcode and ALU output
- **LED indicators**: Pipeline stage activity and hazard detection status
- **Switch inputs**: Single-step mode for pedagogical demonstration
- **Button controls**: Reset, clock enable, and manual stall override


##  Verification Strategy

### Test Coverage
1. **Directed Tests**:
   - Data hazard scenarios (RAW, WAR, WAW)
   - Control hazard edge cases (back-to-back branches)
   - Load-use hazards
   - Register bypass paths
   - Reset and initialization sequences

2. **Pseudo-Random Tests**:
   - Random instruction generation with constrained operands
   - Coverage-driven validation of forwarding logic
   - Stress testing for corner cases

3. **Hardware Validation**:
   - Real-time execution on Nexys 3
   - Seven-segment output verification
   - Performance counter analysis

##  Getting Started

### Prerequisites
- Xilinx ISE 14.7
- ModelSim for simulation (optional)
- Nexys 3 FPGA board (optional for hardware deployment)




##  Key Design Decisions

### Timing Closure
- **Critical Path**: Register file read → ALU → result forwarding → register write
- **Optimization**: Balanced pipeline stages to minimize longest path
- **Clock Strategy**: Conservative 50 MHz target for Spartan-6 speed grade

### Forwarding vs. Stalling
- Prioritized **forwarding** to maximize throughput
- Stalls only inserted when forwarding is insufficient (load-use hazards)
- Branch resolution moved to ID stage to reduce control hazard penalty

### Debug Observability
- Seven-segment display provides real-time insight without external tools
- Critical for pedagogical demonstrations and on-board verification

##  Technical References

### Pipeline Concepts
- **Forwarding Network**: Detects EX-stage dependencies and bypasses data
- **Stall Insertion**: Hazard unit asserts control signals to freeze IF/ID stages
- **Branch Flush**: Clears IF/ID pipeline registers on taken branches

### Instruction Support
- **R-type**: ADD, SUB, AND, OR, SLT, etc.
- **I-type**: ADDI, ANDI, ORI, LW, SW, BEQ, BNE
- **J-type**: J, JAL (with return address in $ra)

##  Educational Value

This project demonstrates:
- **Pipelining fundamentals**: Stage partitioning and register insertion
- **Hazard mitigation**: Detection, forwarding, stalling, and flushing
- **FPGA synthesis**: Timing-driven optimization and resource constraints
- **Hardware-software interface**: Assembly-level instruction execution
- **Verification methodology**: Testbench design and coverage analysis

##  Future Enhancements

- [ ] Branch prediction unit (2-bit saturating counter)
- [ ] Cache hierarchy (I-cache and D-cache)
- [ ] Out-of-order execution (Tomasulo's algorithm)
- [ ] Multi-cycle instructions (multiply/divide)
- [ ] Exception handling (interrupts and traps)
- [ ] Performance counters and profiling support

##  Author

**Dur E Haider Hussain Fayyaz**  
Computer Engineering, NUST CEME  
📧 durhaider2@gmail.com  
🔗 [LinkedIn](https://linkedin.com/in/dur-haider-a5bb1826a)

##  License

This project is available for educational and research purposes. Please cite appropriately if used in academic work.

##  Acknowledgments

- NUST CEME Computer Architecture Lab for FPGA resources
- Xilinx ISE/Vivado documentation and tutorials
- Patterson & Hennessy's "Computer Organization and Design" textbook

---

*Part of undergraduate coursework in Computer Architecture and Digital Design at NUST College of Electrical & Mechanical Engineering.*
