`timescale 1ns / 1ps

module comparator_testbench();

    reg [3:0] A;
    reg [3:0] B;
    wire A_greater_B;
    wire A_less_B;
    wire A_equal_B;

comparator dut(
    .A(A),
    .B(B),
    .Equal(A_equal_B),
    .Bigger(A_greater_B),
    .Lower(A_less_B)
    );

    initial begin
        A = 4'b0011; B = 4'b0100; // A < B
        #10 A = 4'b0101; B = 4'b0100; // A > B
        #10 A = 4'b0110; B = 4'b0110; // A == B
        #10 $finish;
    end


endmodule
