`timescale 1ns / 1ps

module output_driver_tb;

    // Test için giriþler
    logic [1:0] state;
    
    // Modül çýkýþlarý
    logic main_red;
    logic main_yellow;
    logic main_green;
    logic side_red;
    logic side_yellow;
    logic side_green;

    // Modül instantiation
    output_driver uut (
        .state(state),
        .main_red(main_red),
        .main_yellow(main_yellow),
        .main_green(main_green),
        .side_red(side_red),
        .side_yellow(side_yellow),
        .side_green(side_green)
    );

    // Test senaryolarýný baþlatacak baþlangýç bloðu
    initial begin
        // Test için state deðerlerini sýrasýyla ver
        state = 2'b00; // s0
        #10; // 10 ns bekle
        $display("State: %b, main_red: %b, main_yellow: %b, main_green: %b, side_red: %b, side_yellow: %b, side_green: %b", 
                 state, main_red, main_yellow, main_green, side_red, side_yellow, side_green);
        
        state = 2'b01; // s1
        #10; // 10 ns bekle
        $display("State: %b, main_red: %b, main_yellow: %b, main_green: %b, side_red: %b, side_yellow: %b, side_green: %b", 
                 state, main_red, main_yellow, main_green, side_red, side_yellow, side_green);

        state = 2'b10; // s2
        #10; // 10 ns bekle
        $display("State: %b, main_red: %b, main_yellow: %b, main_green: %b, side_red: %b, side_yellow: %b, side_green: %b", 
                 state, main_red, main_yellow, main_green, side_red, side_yellow, side_green);

        state = 2'b11; // s3
        #10; // 10 ns bekle
        $display("State: %b, main_red: %b, main_yellow: %b, main_green: %b, side_red: %b, side_yellow: %b, side_green: %b", 
                 state, main_red, main_yellow, main_green, side_red, side_yellow, side_green);

        $finish; // Testi sonlandýr
    end
endmodule
