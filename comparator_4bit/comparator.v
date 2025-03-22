`timescale 1ns / 1ps

module comparator(
    input [3:0] A,
    input [3:0] B,
    output Equal,
    output Bigger,
    output Lower
    );
    
    assign Bigger = (A > B);
    assign Equal   = (A == B);
    assign Lower    = (A < B);
    
endmodule
