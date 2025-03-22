`timescale 1ns / 1ps

module D_flipflop(
    input wire D,
    input wire clk,
    input wire sync_reset,
    output reg Q
    );
    
    always @(posedge clk) 
    begin
     if(sync_reset==1'b1)
      Q <= 1'b0; 
     else 
      Q <= D; 
    end 
    
endmodule