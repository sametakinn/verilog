`timescale 1ns / 1ps

module uart_tx_tb;

    // Parameters
    parameter c_clkfreq = 100_000_000;
    parameter c_baudrate = 115_200;
    localparam CLK_PERIOD = 10; // 100 MHz clock (10ns period)
    localparam BAUD_PERIOD = 1_000_000_000 / c_baudrate; // Baud rate period in ns

    // Testbench Signals
    reg clk = 0;
    reg rst_n;
    reg [7:0] din_i;
    reg tx_start_i;
    wire tx_o;
    wire tx_done_tick_o;

    // DUT Instance
    uart_tx #(.c_clkfreq(c_clkfreq), .c_baudrate(c_baudrate)) uut (
        .clk(clk),
        .rst_n(rst_n),
        .din_i(din_i),
        .tx_start_i(tx_start_i),
        .tx_o(tx_o),
        .tx_done_tick_o(tx_done_tick_o)
    );

    // Clock Generation
    always #(CLK_PERIOD/2) clk = ~clk;

    // Test Sequence
    initial begin
        rst_n = 0;
        tx_start_i = 0;
        din_i = 8'h00;
        #10;
        rst_n = 1;
        #10;

        // Transmit Byte
        din_i = 8'hA5;
        tx_start_i = 1;
        #CLK_PERIOD;
        tx_start_i = 0;

        // Wait for Transmission Completion
        wait(tx_done_tick_o);
        #BAUD_PERIOD;

        // Transmit Another Byte
        din_i = 8'h3C;
        tx_start_i = 1;
        #CLK_PERIOD;
        tx_start_i = 0;

        wait(tx_done_tick_o);
        #BAUD_PERIOD;

        $stop;
    end

endmodule

