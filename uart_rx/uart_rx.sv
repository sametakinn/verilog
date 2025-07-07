module uart_rx #(
    parameter c_clkfreq = 100_000_000,
    parameter c_baudrate = 115_200
)(
    input  logic clk,
    input  logic rst_n,
    input  logic rx_in_i,
    output logic [7:0] dout_o,
    output logic rx_done_tick_o
);

    localparam S_IDLE     = 2'b00;
    localparam S_START    = 2'b01;
    localparam S_RECEIVE  = 2'b10;
    localparam S_STOP     = 2'b11;

    localparam integer counter_lim = c_clkfreq / c_baudrate;

    logic [1:0] state = S_IDLE;
    logic [15:0] counter = 0;
    logic [3:0] bit_counter = 0;
    logic [7:0] rx_buffer = 0;

    always_ff @(posedge clk) begin
        if (!rst_n) begin
            state <= S_IDLE;
            counter <= 0;
            bit_counter <= 0;
            rx_buffer <= 0;
            rx_done_tick_o <= 0;
            dout_o <= 0;
        end else begin
            case (state)

                // Start biti bekleniyor
                S_IDLE: begin
                    rx_done_tick_o <= 0;
                    if (!rx_in_i) begin // start biti algýlandý
                        state <= S_START;
                        counter <= 0;
                    end
                end

                // Start biti örnekleme zamaný ortasý için bekle
                S_START: begin
                    counter <= counter + 1;
                    if (counter == (counter_lim >> 1)) begin // yarým baud süresi
                        if (!rx_in_i) begin // hala start biti düþükse geçerli
                            counter <= 0;
                            bit_counter <= 0;
                            state <= S_RECEIVE;
                        end else begin
                            state <= S_IDLE; // hatalý tetikleme
                        end
                    end
                end

                // Veri bitleri alýnýr
                S_RECEIVE: begin
                    counter <= counter + 1;
                    if (counter == counter_lim - 1) begin
                        counter <= 0;
                        rx_buffer <= {rx_in_i, rx_buffer[7:1]};
                        bit_counter <= bit_counter + 1;
                        if (bit_counter == 7) begin
                            state <= S_STOP;
                        end
                    end
                end

                // Stop biti kontrolü ve veri aktarýmý
                S_STOP: begin
                    counter <= counter + 1;
                    if (counter == counter_lim - 1) begin
                        state <= S_IDLE;
                        dout_o <= rx_buffer;
                        rx_done_tick_o <= 1;
                        counter <= 0;
                    end
                end

            endcase
        end
    end

endmodule

    
    
