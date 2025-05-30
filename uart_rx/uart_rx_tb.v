`timescale 1ns / 1ps

module uart_rx_tb;

    // Parametreler
    parameter c_clkfreq = 100_000_000;  // 100 MHz saat frekansý
    parameter c_baudrate = 115_200;     // 115200 baud rate
    parameter bit_period = 1_000_000_000 / c_baudrate;  // 1 bit süresi (ns cinsinden)

    // Testbench sinyalleri
    reg clk = 0;
    reg rst_n;
    reg rx_in_i;
    wire [7:0] dout_o;
    wire rx_done_tick_o;

    // UART RX modülünü instantiate et
    uart_rx #(
        .c_clkfreq(c_clkfreq),
        .c_baudrate(c_baudrate)
    ) uut (
        .clk(clk),
        .rst_n(rst_n),
        .rx_in_i(rx_in_i),
        .dout_o(dout_o),
        .rx_done_tick_o(rx_done_tick_o)
    );

    // Clock üretimi (100 MHz -> 10ns periyod)
    always #5 clk = ~clk;

    // Test senaryosu
    initial begin
        // Reset sinyalini baþlat
        rst_n = 0;
        rx_in_i = 1;  // UART IDLE (Varsayýlan olarak HIGH olmalý)
        #100;         // Reset aktif tut

        // Reset kaldýr
        rst_n = 1;
        #100;

        // UART Start biti (LOW)
        rx_in_i = 0;
        #(bit_period);
        
        // 8-bit veri (LSB-First - 0xD2 = 1101_0010)
        rx_in_i = 0; #(bit_period);
        rx_in_i = 1; #(bit_period);
        rx_in_i = 0; #(bit_period);
        rx_in_i = 0; #(bit_period);
        rx_in_i = 1; #(bit_period);
        rx_in_i = 0; #(bit_period);
        rx_in_i = 1; #(bit_period);
        rx_in_i = 1; #(bit_period);
        
        // Stop biti (HIGH)
        rx_in_i = 1;
        #(bit_period);

        // Sonucu incelemek için bir süre bekle
        #50000;

        // Simülasyonu bitir
        $stop;
    end

endmodule