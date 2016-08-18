module pc_reg(input wire clk,
	      input wire rst,
	      output reg[`InstAddrBus] pc);
   always @ (posedge clk) begin
      if (rst == `RstEnable) begin
	 ce <= `ChipDisable;
      end else begin
	 cs <= `ChipEnable;
      end
   end

   always @ (posedge clk) begin
      if (ce == `ChipDisable) begin
	 pc <= `ZeroWord;
      end else begin
	 pc <= pc + 4'h4;
      end
   end
   
endmodule // pc_reg
