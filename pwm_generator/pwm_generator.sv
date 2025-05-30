`timescale 1ns / 1ps

module pwm_generator(
    input logic clk,
    input logic rst,
    input logic [7:0] duty,
    output logic pwm
    );

    logic [7:0] counter;
    
    always_ff @(posedge clk or posedge rst) begin
        if (rst) 
            counter <= 8'd0; // Reset aktifken sayaç sýfýrlanýr
        else 
            counter <= counter + 8'd1; // Her clock kenarýnda artar
    end
    
    always_comb begin
        if (duty > counter)
            pwm = 1;
        else
            pwm = 0;
    end
      
endmodule

