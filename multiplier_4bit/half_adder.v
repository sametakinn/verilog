`timescale 1ns / 1ps

module half_adder(
    input A,
    input B,
    output S,
    output C
    );
    assign S = A ^ B;    // XOR i�lemi ile toplam
    assign C = A & B;  // AND i�lemi ile ta��ma
    
endmodule
