`timescale 1ns / 1ps

module uart_tx #(
    parameter c_clkfreq = 100_000_000,
    parameter c_baudrate = 115_200
    )(
    input clk,
    input rst_n,
    input [7:0] din_i,
    input tx_start_i,
    output reg tx_o,
    output reg tx_done_tick_o
    );
    
    
    localparam S_IDLE = 2'b00;
    localparam S_TRANSFER = 2'b01;
    
    reg [9:0] tx_buffer = 10'b00_0000_0000;
    reg state = S_IDLE;
    localparam counter_lim = c_clkfreq / c_baudrate - 1;
    reg [15:0] counter = 16'b0;
    reg [3:0] bit_counter = 3'b0000;
    
    always @(posedge clk)begin 
        if (!rst_n) begin
            state <= S_IDLE;
            tx_o <= 1'b1;          
            tx_done_tick_o <= 1'b0;
        end else begin
            case (state)
                S_IDLE: begin 
                    tx_o <= 1'b1;
                    tx_done_tick_o <= 1'b0;
                    
                    if(tx_start_i)begin
                        state <= S_TRANSFER;
                        counter <= 0;
                        bit_counter <= 0;
                        tx_buffer <= {1'b1,din_i,1'b0};
                    end
                end
                S_TRANSFER: begin 
                    tx_o <= tx_buffer[0];
                    counter <= counter + 1;
                    
                    if (counter == counter_lim-1) begin
                        counter <= 0;
                        bit_counter <= bit_counter + 1;
                        tx_buffer[8:0] <= tx_buffer[9:1];
                        
                        if (bit_counter == 9 ) begin 
                            
                            tx_done_tick_o <= 1;
                            state <= S_IDLE;
                        end
                    end
                    
                end

            endcase
        end  
        
    end
    
    
    
endmodule
