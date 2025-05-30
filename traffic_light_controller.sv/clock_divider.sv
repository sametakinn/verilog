`timescale 1ns / 1ps



module clock_divider(
    input logic clk_in,     // Input system clock
    input logic rst,        // Reset signal
    output logic clk_out     // Output divided clock
    );
    
    // Parameter to set the division factor (e.g., divide by 50,000,000 for 1Hz from 50MHz clock)
    parameter DIV_FACTOR = 10; // Adjust as per your system clock frequency

    // Internal counter
    reg [31:0] counter;

    // Clock divider logic
    always_ff @(posedge clk_in or posedge rst) begin
        if (rst) begin
            counter <= 0;
            clk_out <= 0;
        end else begin
            if (counter == (DIV_FACTOR - 1)) begin
                counter <= 0;           // Reset counter
                clk_out <= ~clk_out;    // Toggle output clock
            end else begin
                counter <= counter + 1; // Increment counter
            end
        end
    end
endmodule
