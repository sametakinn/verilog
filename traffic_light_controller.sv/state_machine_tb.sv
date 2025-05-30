module state_machine_tb;
    logic clk;
    logic rst;
    logic [1:0] state;
    logic [5:0] timer;

    // Test edilecek mod�l� ba�l�yoruz
    state_machine uut (
        .clk(clk),
        .rst(rst),
        .state(state),
        .timer(timer)
    );

    // Saat sinyali �retimi
    always #5 clk = ~clk;  // 10 ns periyotlu clock (5 ns high, 5 ns low)

    initial begin
        // Ba�lang��
        $display("Simulation started...");
        clk = 0;
        rst = 1;
        #10 rst = 0;  // Reset'i 10 ns sonra kald�r

        // 1000 ns boyunca sim�lasyonu �al��t�r
        #1000;
        $finish;  // Sim�lasyonu bitir
    end

    // Durum de�i�ti�inde ekrana yazd�r
    always @(posedge clk) begin
        $display("Time=%0t ns, State=%b, Timer=%d", $time, state, timer);
    end

endmodule

