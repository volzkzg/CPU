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
        $dumpvars(0, sopc.cpu.register.storage[5]);
*/
        $readmemh("rom.txt", sopc.inst_rom0.inst_mem);

        clock = 1'b0;
        reset = 1'b1;

        #20 reset = 1'b0;
        #12 `AR(5, 32'h00001100);
        #2  `AR(5, 32'h00001120);
        #2  `AR(5, 32'h00005520);
        #2  `AR(5, 32'h00005564);
        `PASS;
    end
endmodule
