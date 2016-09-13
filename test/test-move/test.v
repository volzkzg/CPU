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
       /*
        $dumpvars;
        $dumpvars(0, sopc.cpu.register.storage[1]);
        $dumpvars(0, sopc.cpu.register.storage[2]);
        $dumpvars(0, sopc.cpu.register.storage[3]);
        $dumpvars(0, sopc.cpu.register.storage[4]);
        */
        $readmemh("rom.txt", sopc.inst_rom0.inst_mem);

        clock = 1'b0;
        reset = 1'b1;

        #20 reset = 1'b0;
        #12 `AR(1, 32'h00000000); `AR(2, 32'hxxxxxxxx); `AR(3, 32'hxxxxxxxx); `AR(4, 32'hxxxxxxxx); `AHI(32'h00000000); `ALO(32'h00000000);
        #2  `AR(1, 32'h00000000); `AR(2, 32'hFFFF0000); `AR(3, 32'hxxxxxxxx); `AR(4, 32'hxxxxxxxx); `AHI(32'h00000000); `ALO(32'h00000000);
        #2  `AR(1, 32'h00000000); `AR(2, 32'hFFFF0000); `AR(3, 32'h05050000); `AR(4, 32'hxxxxxxxx); `AHI(32'h00000000); `ALO(32'h00000000);
        #2  `AR(1, 32'h00000000); `AR(2, 32'hFFFF0000); `AR(3, 32'h05050000); `AR(4, 32'h00000000); `AHI(32'h00000000); `ALO(32'h00000000);
        #2  `AR(1, 32'h00000000); `AR(2, 32'hFFFF0000); `AR(3, 32'h05050000); `AR(4, 32'hFFFF0000); `AHI(32'h00000000); `ALO(32'h00000000);
        #2  `AR(1, 32'h00000000); `AR(2, 32'hFFFF0000); `AR(3, 32'h05050000); `AR(4, 32'hFFFF0000); `AHI(32'h00000000); `ALO(32'h00000000);
        #2  `AR(1, 32'h00000000); `AR(2, 32'hFFFF0000); `AR(3, 32'h05050000); `AR(4, 32'h05050000); `AHI(32'h00000000); `ALO(32'h00000000);
        #2  `AR(1, 32'h00000000); `AR(2, 32'hFFFF0000); `AR(3, 32'h05050000); `AR(4, 32'h05050000); `AHI(32'h00000000); `ALO(32'h00000000);
        #2  `AR(1, 32'h00000000); `AR(2, 32'hFFFF0000); `AR(3, 32'h05050000); `AR(4, 32'h05050000); `AHI(32'h00000000); `ALO(32'h00000000);
        #2  `AR(1, 32'h00000000); `AR(2, 32'hFFFF0000); `AR(3, 32'h05050000); `AR(4, 32'h05050000); `AHI(32'hFFFF0000); `ALO(32'h00000000);
        #2  `AR(1, 32'h00000000); `AR(2, 32'hFFFF0000); `AR(3, 32'h05050000); `AR(4, 32'h05050000); `AHI(32'h05050000); `ALO(32'h00000000);
        #2  `AR(1, 32'h00000000); `AR(2, 32'hFFFF0000); `AR(3, 32'h05050000); `AR(4, 32'h05050000); `AHI(32'h05050000); `ALO(32'h00000000);
        #2  `AR(1, 32'h00000000); `AR(2, 32'hFFFF0000); `AR(3, 32'h05050000); `AR(4, 32'h05050000); `AHI(32'h05050000); `ALO(32'h05050000);
        #2  `AR(1, 32'h00000000); `AR(2, 32'hFFFF0000); `AR(3, 32'h05050000); `AR(4, 32'h05050000); `AHI(32'h05050000); `ALO(32'hFFFF0000);
        #2  `AR(1, 32'h00000000); `AR(2, 32'hFFFF0000); `AR(3, 32'h05050000); `AR(4, 32'h05050000); `AHI(32'h05050000); `ALO(32'h00000000);
        #2  `AR(1, 32'h00000000); `AR(2, 32'hFFFF0000); `AR(3, 32'h05050000); `AR(4, 32'h00000000); `AHI(32'h05050000); `ALO(32'h00000000);
        `PASS;
    end
endmodule
