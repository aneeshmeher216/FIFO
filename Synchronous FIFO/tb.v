module tb;
  parameter  WIDTH=32, DEPTH=16;
  
  reg clk,rst_n;
  reg wr_en, rd_en;
  reg [WIDTH-1:0] data_in;
  
  wire [WIDTH-1:0] data_out;
  wire full, empty;
  
  sync_fifo fifo_1(clk, rst_n, wr_en, rd_en, data_in, data_out, full, empty);
  
  initial begin
    clk <= 1'b1; rst_n <= 1'b0;
    wr_en <= 1'b0; rd_en <= 1'b0;
    
    #7 rst_n <= 1'b1; wr_en <= 1'b1; data_in <= 32'd1;
    #10 data_in <= 32'd2; rd_en <= 1;
    #10 data_in <= 32'd3; 
    #10 data_in <= 32'd4;
    #10 data_in <= 32'd5; 
    #10 data_in <= 32'd6; 
    #10 data_in <= 32'd7;
    #10 data_in <= 32'd8;
    #10 data_in <= 32'd9;
    #10 data_in <= 32'd10;
    #10 data_in <= 32'd11;
    #10 data_in <= 32'd12;
    #10 data_in <= 32'd13;
    #10 data_in <= 32'd14;
    #10 data_in <= 32'd15;
    #10 data_in <= 32'd16;
    #10 data_in <= 32'd17; 
    #10 data_in <= 32'd18;
	#10 wr_en <= 0;
    #50  rd_en <= 0;
    

    #50 $finish();
  end
  
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
    $dumpvars(0, tb.fifo_1.fifo_mem);
  end
  
  always #5 clk <= ~clk;
endmodule
