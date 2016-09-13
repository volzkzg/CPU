`timescale 1ns/1ps

module test();
    reg clock, reset;

   min_sopc sopc(
        .clk(clock),
        .rst(reset)
    );

    always #1 clock = ~clock;

    initial begin
        $dumpfile("dump.vcd");

        $dumpvars;
       $dumpvars(0, sopc.top0.regfile1.regs[1]);
       $dumpvars(0, sopc.top0.regfile1.regs[2]);
       $dumpvars(0, sopc.top0.regfile1.regs[3]);
       $dumpvars(0, sopc.top0.regfile1.regs[4]);
       $dumpvars(0, sopc.top0.regfile1.regs[5]);
       $dumpvars(0, sopc.top0.regfile1.regs[6]);
       $dumpvars(0, sopc.top0.regfile1.regs[7]);
        $readmemh("rom.txt", sopc.inst_rom0.inst_mem);

        clock = 1'b0;
        reset = 1'b1;

        #20 reset = 1'b0;
        #1000 `PASS;
    end
endmodule
