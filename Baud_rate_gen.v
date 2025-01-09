`timescale 1ns / 1ps

module BAUD_rate_gen(input clk);

parameter clk_value = 100_000;
parameter baud = 9600;
parameter wait_count = clk_value / baud;
reg bitDone = 0;
integer count = 0;
parameter idle = 0, send = 1, check = 2;
reg [1:0] state = idle;

always@(posedge clk)
 begin
  if(state == idle)
    begin 
    count <= 0;
    end
  else begin
    if(count == wait_count)
       begin
        bitDone <= 1'b1;
        count   <= 0;  
       end
    else
       begin
       count   <= count + 1;
       bitDone <= 1'b0;  
      end    
  end
  end
endmodule