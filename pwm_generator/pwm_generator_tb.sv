`timescale 1ns / 1ps

module pwm_generator_tb;

    reg clk;
    reg rst;
    reg [7:0] duty;
    wire pwm;
    
    // Test edilen mod�l �rne�i
    pwm_generator uut (
        .clk(clk),
        .rst(rst),
        .duty(duty),
        .pwm(pwm)
    );
    
    // 10ns periyotlu saat sinyali �retimi
    always #1 clk = ~clk;
    
    initial begin
        // Ba�lang�� de�erleri
        clk = 0;
        rst = 1;
        duty = 8'd128; // %50 duty cycle
        
        // Reset i�lemi
        #10 rst = 0;
        
        // Farkl� duty cycle de�erleri deneme
        
        #900 $finish; // Sim�lasyonu bitir
    end
    
endmodule




