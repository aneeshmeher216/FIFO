module sync_fifo #(parameter WIDTH=32, DEPTH=16)(
  input clk,rst_n,
  input wr_en, rd_en,
  input [WIDTH-1:0] data_in,
  
  output reg [WIDTH-1:0] data_out,
  output full, empty
);
  
  reg [$clog2(DEPTH)-1:0] wr_ptr, rd_ptr;
  
  reg [WIDTH-1:0] fifo_mem[DEPTH-1:0]; 
	
  always @(posedge clk) begin
    if(!rst_n) begin
      wr_ptr <= 0;
    end
    
    else if(wr_en && !full) begin
      fifo_mem[wr_ptr] <= data_in;
      wr_ptr <= wr_ptr + 1;
    end
  end
  
   always @(posedge clk) begin
    if(!rst_n) begin
      rd_ptr <= 0;
    end
    
     else if(rd_en && !empty) begin
      data_out <= fifo_mem[rd_ptr];
      rd_ptr <= rd_ptr + 1;
    end
  end
  
  assign full = (wr_ptr + 1'b1 == rd_ptr);
  assign empty = (wr_ptr == rd_ptr);
  
endmodule
