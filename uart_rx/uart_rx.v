module uart_rx #(
    parameter c_clkfreq = 100_000_000,
    parameter c_baudrate = 115_200
    )(
    input clk,
    input rst_n,
    input rx_in_i,
    output reg [7:0] dout_o,
    output reg rx_done_tick_o
    );
    
    localparam S_IDLE = 2'b00;
    localparam S_RECEIVE = 2'b01;
    
    reg state = S_IDLE;
    reg [8:0] rx_buffer = 10'b00_0000_0000;
    localparam counter_lim = c_clkfreq / c_baudrate - 1;
    reg [15:0] counter = 16'b0;
    reg [3:0] bit_counter = 3'b0000;
    
    always @(posedge clk)begin 
        if (!rst_n) begin
            state <= S_IDLE;
            counter <= 1'b0;
            bit_counter <=1'b0;          
            rx_done_tick_o <= 1'b0;
        end else begin
            case (state)
                S_IDLE: begin 
                    rx_done_tick_o <= 1'b0;
                    if(!rx_in_i)begin
                        counter <= counter + 1;
                        if (counter == counter_lim) begin
                            state <= S_RECEIVE;
                            counter <= 0;
                            bit_counter <= 0;
                        end
                    end
                end
                
                S_RECEIVE: begin 
                    counter <= counter + 1;
                    if (counter == counter_lim) begin
                        counter <= 0;
                        bit_counter <= bit_counter + 1;
                        rx_buffer <= {rx_in_i,rx_buffer[8:1]};
                    end
                    
                    if (bit_counter == 9 ) begin 
                        dout_o <= rx_buffer[7:0];
                        rx_done_tick_o <= 1;
                        state <= S_IDLE;
                     end
                end

            endcase
        end  
        
    end
    
    
endmodule
