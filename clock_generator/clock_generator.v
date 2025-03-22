`timescale 1ns / 1ps

module clock_generator(
    input wire enable,
    output reg clk
    );
    
    initial clk = 0;  // Initialize the clock
    
    always begin
        if (enable) begin
            #10 clk = ~clk;  // Toggle clock every 10 time units
        end else begin
            #10 clk = clk;  // Maintain the clock state if disabled
        end
    end
    
endmodule