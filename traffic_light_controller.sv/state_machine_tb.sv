module state_machine_tb;
    logic clk;
    logic rst;
    logic [1:0] state;
    logic [5:0] timer;

    // Test edilecek modülü baðlýyoruz
    state_machine uut (
        .clk(clk),
        .rst(rst),
        .state(state),
        .timer(timer)
    );

    // Saat sinyali üretimi
    always #5 clk = ~clk;  // 10 ns periyotlu clock (5 ns high, 5 ns low)

    initial begin
        // Baþlangýç
        $display("Simulation started...");
        clk = 0;
        rst = 1;
        #10 rst = 0;  // Reset'i 10 ns sonra kaldýr

        // 1000 ns boyunca simülasyonu çalýþtýr
        #1000;
        $finish;  // Simülasyonu bitir
    end

    // Durum deðiþtiðinde ekrana yazdýr
    always @(posedge clk) begin
        $display("Time=%0t ns, State=%b, Timer=%d", $time, state, timer);
    end

endmodule

