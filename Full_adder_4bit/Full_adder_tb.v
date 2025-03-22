`timescale 1ns / 1ps

module Full_adder_tb();
    
    reg [3:0] A;
    reg [3:0] B;
    wire [3:0] S;
    wire  C;
    
    
top_module testbench(
    .A(A),
    .B(B),
    .Sum(S),
    .Cout(C)
    );
    
    
   initial 
    begin
    A=4'b0000;
    B=4'b0001;
    #10
    A=4'b0000;
    B=4'b1111;
    #10
    A=4'b0010;
    B=4'b1011;
    #10
    A=4'b0100;
    B=4'b0101;
    #10
    A=4'b1111;
    B=4'b1111;
    #10
    $finish;
    end
endmodule