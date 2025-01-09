`timescale 1ns / 1ps


module transmitter(input clk,
                output reg tx,
                input [7:0] txin,
                input start);

reg [9:0] txData;//stop bit data start
integer bitIndex = 0; //reg [3:0];
reg [9:0] shifttx = 0;
reg bitDone = 0;
parameter idle = 0, send = 1, check = 2;
reg [1:0] state = idle;

 always@(posedge clk)
 begin
 case(state)
 idle : 
     begin
           tx       <= 1'b1;
           txData   <= 0;
           bitIndex <= 0;
           shifttx  <= 0;
           
            if(start == 1'b1)
              begin
                txData <= {1'b1,txin,1'b0};
                state  <= send;
              end
            else
              begin           
               state <= idle;
              end
     end
 
  send: begin
           tx       <= txData[bitIndex];
           state    <= check;
           shifttx  <= {txData[bitIndex], shifttx[9:1]};
  end 
  
  check: 
  begin
       
           
               if(bitIndex <= 9) //0 - 9 = 10
                  begin
                    if(bitDone == 1'b1)
                     begin
                     state <= send;
                     bitIndex <= bitIndex + 1;
                     end
                 end
                else
                begin
                state <= idle;
                bitIndex <= 0;
                end
            end
 
 default: state <= idle;
 endcase
 end
  
assign txdone = (bitIndex == 9 && bitDone == 1'b1) ? 1'b1 : 1'b0;
endmodule
