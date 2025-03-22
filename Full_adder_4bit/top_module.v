`timescale 1ns / 1ps

module top_module(
    input wire [3:0]A,
    input wire [3:0]B,
    output wire [3:0]Sum,
    output wire Cout
    );
    
    wire [2:0]c;
    
Full_adder DUT1(
    .A(A[0]),
    .B(B[0]),
    .Cin(1'b0),
    .Cout(c[0]),
    .Sum(Sum[0])
    );
    
Full_adder DUT2(
    .A(A[1]),
    .B(B[1]),
    .Cin(c[0]),
    .Cout(c[1]),
    .Sum(Sum[1])
    );
    
Full_adder DUT3(
    .A(A[2]),
    .B(B[2]),
    .Cin(c[1]),
    .Cout(c[2]),
    .Sum(Sum[2])
    );
    
 Full_adder DUT4(
    .A(A[3]),
    .B(B[3]),
    .Cin(c[2]),
    .Cout(Cout),
    .Sum(Sum[3])
    );
    
    
endmodule
