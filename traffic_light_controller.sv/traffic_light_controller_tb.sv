module traffic_light_controller_tb;

    // Testbench input ve output sinyalleri
    logic clk;
    logic rst;
    logic main_red, main_yellow, main_green;
    logic side_red, side_yellow, side_green;
    logic [5:0] timer;

    // Test edilen modül (traffic_light_controller)
    traffic_light_controller uut (
        .clk(clk),
        .rst(rst),
        .main_red(main_red),
        .main_yellow(main_yellow),
        .main_green(main_green),
        .side_red(side_red),
        .side_yellow(side_yellow),
        .side_green(side_green),
        .timer(timer)
    );

    // Saat sinyali üretimi: 10 ns periyotlu saat
    always #5 clk = ~clk;  // 5 ns high, 5 ns low (10 ns period)

    initial begin
        // Baþlangýç: Reset sinyali ver
        $display("Simulation started...");
        clk = 0;
        rst = 1;  // Reset aktif
        #10 rst = 0;  // Reset'i 10 ns sonra kaldýr

        // 500 ns boyunca simülasyonu çalýþtýr
        #500;

        // Simülasyonu bitir
        $finish;
    end

    // Durum geçiþleri ve ýþýklarýn durumunu gözlemleyip ekrana yazdýr
    always @(posedge clk) begin
        $display("Time=%0t ns, Main Red=%b, Main Yellow=%b, Main Green=%b, Side Red=%b, Side Yellow=%b, Side Green=%b, Timer=%d", 
                 $time, main_red, main_yellow, main_green, side_red, side_yellow, side_green, timer);
    end

endmodule

