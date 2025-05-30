`timescale 1ns / 1ps

module state_machine(
    input logic clk,
    input logic rst,
    output logic [1:0] state,
    output logic [5:0] timer
);

    // S�releri `localparam` ile tan�ml�yoruz
    localparam int TIME_S0 = 30;  // Ana yol ye�il, yan yol k�rm�z�
    localparam int TIME_S1 = 5;   // Ana yol sar�, yan yol k�rm�z�
    localparam int TIME_S2 = 30;  // Ana yol k�rm�z�, yan yol ye�il
    localparam int TIME_S3 = 5;   // Ana yol k�rm�z�, yan yol sar�

    // Durumlar� tan�ml�yoruz
    typedef enum logic [1:0] {
        s0  = 2'b00,  
        s1  = 2'b01,  
        s2  = 2'b10,  
        s3  = 2'b11   
    } state_t;

    state_t current_state;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            current_state <= s0;
            timer <= TIME_S0;  // Ba�lang�� s�resi
        end  
        else begin 
            if (timer == 0) begin
                case (current_state)
                    s0: begin
                        current_state <= s1;
                        timer <= TIME_S1;
                    end
                    s1: begin
                        current_state <= s2;
                        timer <= TIME_S2;
                    end
                    s2: begin
                        current_state <= s3;
                        timer <= TIME_S3;
                    end
                    s3: begin
                        current_state <= s0;
                        timer <= TIME_S0;
                    end
                    default: begin
                        current_state <= s0;
                        timer <= TIME_S0;
                    end
                endcase
            end
            else begin 
                timer <= timer - 1;
            end        
        end
    end

    assign state = current_state;

endmodule
   