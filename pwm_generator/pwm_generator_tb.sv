`timescale 1ns / 1ps

module pwm_generator_tb;

    reg clk;
    reg rst;
    reg [7:0] duty;
    wire pwm;
    
    // Test edilen modül örneði
    pwm_generator uut (
        .clk(clk),
        .rst(rst),
        .duty(duty),
        .pwm(pwm)
    );
    
    // 10ns periyotlu saat sinyali üretimi
    always #1 clk = ~clk;
    
    initial begin
        // Baþlangýç deðerleri
        clk = 0;
        rst = 1;
        duty = 8'd128; // %50 duty cycle
        
        // Reset iþlemi
        #10 rst = 0;
        
        // Farklý duty cycle deðerleri deneme
        
        #900 $finish; // Simülasyonu bitir
    end
    
endmodule




