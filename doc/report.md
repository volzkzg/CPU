# The Five-Stage Pipeline Processor Project Report
This document is a review of this design project. I implemented a complete processor based on MIPS32. 
## Overview 
This is a project of our computer architecture course in summer session. We need to use Verilog, a hardware description language, to pre-layout simulate a five-stage pipeline processor. 

I have implemented almost features of a five-stage pipeline processor:
- Five stage pipeline: (**IF**)instruction fetch, (**ID**)instruction decode, (**EX**)execution, (**MEM**)memory access, (**WB**)write back.
- Support multi-cycle instructions like **MADD\MSUB\DIV**. 
- Support **Delayslot** technique.
- Support **Forwading** technique to ease the influence of data hazard.
- Implemented some extra pseudo-instruction.
- Implemented register HI/LO to support multiplication and division.
- Implemented suspend mechanism to support multiple cycle instructions.

And thanks to [Lei Silei](http://blog.csdn.net/leishangwen/article/category/5723475/3), I followed his blog to build this processor step by step. 
## Implementation
#### Implemented instructions
- Logic instruction: and, andi, or, ori, xor, xori, nor, lui.
- Shift instruction: sll, sllv, sra, srav, srl, srlv.
- Void instruction: nop, ssnop.
- Move instruction: movn, movz, mfhi, mthi, mflo, mtlo.
- Arithmetic instruction: 
	- Simple arithmetic instruction: add, addi, addiu, addu, sub, subu, clo, clz, slt, slti, sltiu, sltu, mul, mult, multu.
	- Two cycle instruction: madd, maddu, msub, msubu.
	- Division instruction: div, divu.
- Transfer instruction:
	- Jump instruction: jr, jalr, j, jal.
	- Branch instruction: b, bal, beq, bgez, bgezal, bgtz, blez, bltz, bltzal, bne.
- Load/Save instruction:
	- Load instruction: lb, lbu, lh, lhu, lw, lwl, lwr.
	- Store instruction: sb, sh, sw, swl, swr.

#### Implemented structures
I have mainly followed the structure given by Lei Silei. The image below is the structure given by him.
![](https://raw.githubusercontent.com/volzkzg/cpu/dev/doc/pic/overview.png)

## Tests

Thanks to Zhijian Liu for telling me how to do automatic test, and Lequn Chen for providing the great test files. 

The following are my test result.

![Waveform simulation of test-logic](https://raw.githubusercontent.com/volzkzg/cpu/dev/doc/pic/testlogic.png)

