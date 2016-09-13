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
        */
        $readmemh("rom.txt", sopc.inst_rom0.inst_mem);

        clock = 1'b0;
        reset = 1'b1;

        #20 reset = 1'b0;
        #12 `AR(1, 32'h00001234);
        #2  `AR(1, 32'h00001234);
        #2  `AR(1, 32'h00001234);
        #2  `AR(1, 32'h00000000);
        #2  `AR(1, 32'h00001234);
        #2  `AR(1, 32'h00001234);
        #2  `AR(1, 32'h00001234);
        #2  `AR(1, 32'h00001234);
        #2  `AR(1, 32'h000089AB);
        `PASS;
    end
endmodule
