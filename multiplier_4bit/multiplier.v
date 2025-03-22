`timescale 1ns / 1ps



module multiplier(
    input wire [3:0] A,    // Birinci giriþ
    input wire [3:0] B,    // Ýkinci giriþ
    output wire [7:0] M // çarpým
    );
    wire [10:0] c;
    wire [5:0] s;
    assign M[0] = A[0] & B[0] ;
    
half_adder half_adder1(
    .A(A[1] & B[0]),
    .B(A[0] & B[1]),
    .S(M[1]),
    .C(c[0])
    );
    
full_adder full_adder1(
    .A(A[2] & B[0]),    
    .B(A[1] & B[1]),    
    .Cin(c[0]),  
    .Sum(s[0]), 
    .Cout(c[1]) 
    ); 
    
full_adder full_adder2(
    .A(A[3] & B[0]),    
    .B(A[2] & B[1]),    
    .Cin(c[1]),  
    .Sum(s[1]), 
    .Cout(c[2]) 
    );
    
half_adder half_adder2(
    .A(A[3] & B[1]),
    .B(c[2]),
    .S(s[2]),
    .C(c[3])
    );
    
half_adder half_adder3(
    .A(A[0] & B[2]),
    .B(s[0]),
    .S(M[2]),
    .C(c[4])
    );
    
full_adder full_adder3(
    .A(A[1] & B[2]),    
    .B(s[1]),    
    .Cin(c[1]),  
    .Sum(s[3]), 
    .Cout(c[5]) 
    );
    
full_adder full_adder4(
    .A(A[2] & B[2]),    
    .B(s[2]),    
    .Cin(c[5]),  
    .Sum(s[4]), 
    .Cout(c[6]) 
    );
    
full_adder full_adder5(
    .A(A[3] & B[2]),    
    .B(c[3]),    
    .Cin(c[6]),  
    .Sum(s[5]), 
    .Cout(c[7]) 
    );
    
half_adder half_adder4(
    .A(A[0] & B[3]),
    .B(s[3]),
    .S(M[3]),
    .C(c[8])
    );
    
full_adder full_adder6(
    .A(A[1] & B[3]),    
    .B(s[4]),    
    .Cin(c[8]),  
    .Sum(M[4]), 
    .Cout(c[9]) 
    );
    
full_adder full_adder7(
    .A(A[2] & B[3]),    
    .B(s[5]),    
    .Cin(c[9]),  
    .Sum(M[5]), 
    .Cout(c[10]) 
    );
    
full_adder full_adder8(
    .A(A[3] & B[3]),    
    .B(c[7]),    
    .Cin(c[10]),  
    .Sum(M[6]), 
    .Cout(M[7]) 
    );
    
endmodule
