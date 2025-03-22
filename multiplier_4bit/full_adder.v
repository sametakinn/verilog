`timescale 1ns / 1ps

module full_adder(
    input wire A,    // Birinci giriþ
    input wire B,    // Ýkinci giriþ
    input wire Cin,  // Giriþ taþýma (carry-in)
    output wire Sum, // Toplam
    output wire Cout // Çýkýþ taþýma (carry-out)
    );
    assign Sum = A ^ B ^ Cin;           // XOR iþlemleri ile toplam
    assign Cout = (A & B) | (B & Cin) | (A & Cin); // AND ve OR iþlemleri ile taþýma
   
    
endmodule