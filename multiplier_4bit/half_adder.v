`timescale 1ns / 1ps

module half_adder(
    input A,
    input B,
    output S,
    output C
    );
    assign S = A ^ B;    // XOR iþlemi ile toplam
    assign C = A & B;  // AND iþlemi ile taþýma
    
endmodule
