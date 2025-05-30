`timescale 1ns / 1ps

module BRAM_tb;

    // Parameters
    localparam RAM_WIDTH = 16;
    localparam RAM_DEPTH = 1024;
    localparam ADDR_WIDTH = $clog2(RAM_DEPTH);

    // Signals
    reg                        clk;
    reg                        we_i;
    reg                        re_i;
    reg  [ADDR_WIDTH-1:0]      addr_i;
    reg  [RAM_WIDTH-1:0]       din_i;
    wire [RAM_WIDTH-1:0]       dout_o;

    // Instantiate the DUT (Device Under Test)
    BRAM #(
        .RAM_WIDHT(RAM_WIDTH),
        .RAM_DEPTH(RAM_DEPTH)
    ) uut (
        .clk(clk),
        .we_i(we_i),
        .re_i(re_i),
        .addr_i(addr_i),
        .din_i(din_i),
        .dout_o(dout_o)
    );

    // Clock generation
    always #5 clk = ~clk;  // 100 MHz clock

    // Test procedure
    initial begin
        // Initialize signals
        clk = 0;
        we_i = 0;
        re_i = 0;
        addr_i = 0;
        din_i = 0;

        // Wait for global reset
        #10;

        // Write data to address 0
        addr_i = 0;
        din_i = 16'hABCD;
        we_i = 1;
        re_i = 0;
        #10;

        // Disable write
        we_i = 0;
        #10;

        // Read data from address 0
        re_i = 1;
        #10;

        // Check another write-read cycle
        addr_i = 5;
        din_i = 16'h1234;
        we_i = 1;
        re_i = 0;
        #10;

        // Disable write, then read
        we_i = 0;
        re_i = 1;
        #10;

        // Finish simulation
        $finish;
    end

endmodule
