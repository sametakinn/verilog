`timescale 1ns / 1ps


module clock_generator_testbench();

    reg enable ;
    wire clk ;
    
clock_generator DUT(
    .enable(enable),
    .clk(clk)
    );
    
    initial begin
     enable = 1;
     #100
     enable =0 ;
     #100
     $finish;

    end
    
    
endmodule