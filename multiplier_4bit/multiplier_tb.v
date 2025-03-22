`timescale 1ns / 1ps

module multiplier_testbench();
 
     reg [3:0] A ;
     reg [3:0] B ;
     wire [7:0] M;
     
   
 multiplier Dut(
    .A(A),    
    .B(B),    
    .M(M) 
    );
       
    initial 
     begin
     A = 4'b1010 ;
     B = 4'b1010 ;
     #10
     A = 4'b1111 ;
     B = 4'b0000 ;
     #10
     A = 4'b1111 ;
     B = 4'b1111 ;
     #10
     A = 4'b1011 ;
     B = 4'b1101 ;
     #10
     A = 4'b1111 ;
     B = 4'b1001 ;
     #10
     A = 4'b1001 ;
     B = 4'b0011 ;
     #10
     $finish;
     end
endmodule
