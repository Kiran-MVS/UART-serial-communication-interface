`timescale 1ns / 1ps

module receiver(input clk,input rx);

parameter clk_value = 100_000;
parameter baud = 9600;
parameter wait_count = clk_value / baud;
reg bitDone = 0;
integer rcount = 0;
integer rindex = 0;
parameter ridle = 0, rwait = 1, recv = 2, rcheck = 3;
reg [1:0] rstate;
reg [9:0] rxdata;


 always@(posedge clk)
 begin
 case(rstate)
 ridle : 
     begin
      rxdata <= 0;
      rindex <= 0;
      rcount <= 0;
        
         if(rx == 1'b0)
          begin
           rstate <= rwait;
          end
         else
           begin
           rstate <= ridle;
           end
     end
     
rwait : 
begin
      if(rcount < wait_count / 2)
         begin
          rcount <= rcount + 1;
          rstate <= rwait;
         end
     else
       begin
          rcount <= 0;
          rstate <= recv;
          rxdata <= {rx,rxdata[9:1]}; 
       end
end
 
 
recv : 
begin
     if(rindex <= 9) 
      begin
      if(bitDone == 1'b1) 
        begin
        rindex <= rindex + 1;
        rstate <= rwait;
        end
      end
      else
        begin
        rstate <= ridle;
        rindex <= 0;
        end
end
 
 
default : rstate <= ridle;
  
 endcase
 end
 
 
assign rxout = rxdata[8:1]; 
assign rxdone = (rindex == 9 && bitDone == 1'b1) ? 1'b1 : 1'b0;

 endmodule

 