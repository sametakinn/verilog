module Full_adder(
    input wire A,
    input wire B,
    input wire Cin,
    output reg Cout,
    output reg Sum
    );
    
    reg w1,w2,w3;
    
    always @(*) 
     begin
     w1 = A ^ B ;
     Sum = w1 ^ Cin ;
     w2 = w1 & Cin ;
     w3 = A & B ; 
     Cout = w2 | w3 ;
     end
    
    
endmodule