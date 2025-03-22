`timescale 1ns / 1ps

module full_adder(
    input wire A,    // Birinci giri�
    input wire B,    // �kinci giri�
    input wire Cin,  // Giri� ta��ma (carry-in)
    output wire Sum, // Toplam
    output wire Cout // ��k�� ta��ma (carry-out)
    );
    assign Sum = A ^ B ^ Cin;           // XOR i�lemleri ile toplam
    assign Cout = (A & B) | (B & Cin) | (A & Cin); // AND ve OR i�lemleri ile ta��ma
   
    
endmodule