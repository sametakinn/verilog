
module traffic_light_controller(
    input logic clk,          // System clock
    input logic rst,          // Reset signal
    output logic main_red,    // Main road red light
    output logic main_yellow, // Main road yellow light
    output logic main_green,  // Main road green light
    output logic side_red,    // Side road red light
    output logic side_yellow, // Side road yellow light
    output logic side_green,  // Side road green light
    output logic [5:0] timer  // Timer output for debugging/monitoring
    );
    
    logic clk_div;            // Divided clock signal
    logic [1:0] state;        // Current state signal from the state machine
    // Parameter to set the division factor (e.g., divide by 50,000,000 for 1Hz from 50MHz clock)
    parameter DIV_FACTOR = 10; // Adjust as per your system clock frequency

clock_divider #(.DIV_FACTOR(DIV_FACTOR)) clock_divider_inst( 
    .clk_in(clk),     // Input system clock
    .rst(rst),        // Reset signal
    .clk_out(clk_div)     // Output divided clock
);

state_machine state_machine_inst(
    .clk(clk_div),
    .rst(rst),
    .state(state),
    .timer(timer)
);
    
output_driver output_driver_inst (
        .state(state),       // Current state input
        .main_red(main_red), // Main road red light
        .main_yellow(main_yellow), // Main road yellow light
        .main_green(main_green),   // Main road green light
        .side_red(side_red),       // Side road red light
        .side_yellow(side_yellow), // Side road yellow light
        .side_green(side_green)    // Side road green light
    );

endmodule
