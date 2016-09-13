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

       $readmemh("rom.txt", sopc.inst_rom0.inst_mem);

        clock = 1'b0;
        reset = 1'b1;

        #20 reset = 1'b0;
        #12 `AR(1, 32'h01010000); `AR(2, 32'hxxxxxxxx); `AR(3, 32'hxxxxxxxx); `AR(4, 32'hxxxxxxxx);
        #2  `AR(1, 32'h01010101); `AR(2, 32'hxxxxxxxx); `AR(3, 32'hxxxxxxxx); `AR(4, 32'hxxxxxxxx);
        #2  `AR(1, 32'h01010101); `AR(2, 32'h01011101); `AR(3, 32'hxxxxxxxx); `AR(4, 32'hxxxxxxxx);
        #2  `AR(1, 32'h01011101); `AR(2, 32'h01011101); `AR(3, 32'hxxxxxxxx); `AR(4, 32'hxxxxxxxx);
        #2  `AR(1, 32'h01011101); `AR(2, 32'h01011101); `AR(3, 32'h00000000); `AR(4, 32'hxxxxxxxx);
        #2  `AR(1, 32'h00000000); `AR(2, 32'h01011101); `AR(3, 32'h00000000); `AR(4, 32'hxxxxxxxx);
        #2  `AR(1, 32'h00000000); `AR(2, 32'h01011101); `AR(3, 32'h00000000); `AR(4, 32'h0000FF00);
        #2  `AR(1, 32'h0000FF00); `AR(2, 32'h01011101); `AR(3, 32'h00000000); `AR(4, 32'h0000FF00);
        #2  `AR(1, 32'hFFFF00FF); `AR(2, 32'h01011101); `AR(3, 32'h00000000); `AR(4, 32'h0000FF00);
        `PASS;
    end
endmodule
