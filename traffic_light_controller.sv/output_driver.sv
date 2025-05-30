`timescale 1ns / 1ps

module output_driver(
    input logic [1:0] state,       // Current state of the state machine
    output logic main_red,          // Main road red light
    output logic main_yellow,       // Main road yellow light
    output logic main_green,        // Main road green light
    output logic side_red,          // Side road red light
    output logic side_yellow,       // Side road yellow light
    output logic side_green         // Side road green light
    );

    // Enum türü tanýmlamasý
    typedef enum logic [1:0] {
        s0  = 2'b00,  
        s1  = 2'b01,  
        s2  = 2'b10,  
        s3  = 2'b11   
    } state_t;
    
    // Enum türünde state deðiþkeni
    state_t current_state;
    
    // Enum'a dönüþüm yapýlýr
    assign current_state = state_t'(state); // Type casting

    // Kombinasyonel çýkýþ mantýðý
    always_comb begin
        // Varsayýlan tüm ýþýklarý kapat
        main_red = 0;
        main_yellow = 0;
        main_green = 0;
        side_red = 0;
        side_yellow = 0;
        side_green = 0;
        
        case (current_state) // Enum türündeki deðiþken kullanýldý
            s0: begin
                main_green = 1; // Main road green
                side_red = 1;   // Side road red
            end
            s1: begin
                main_yellow = 1; // Main road yellow
                side_red = 1;    // Side road red
            end
            s2: begin
                main_red = 1;   // Main road red
                side_green = 1; // Side road green
            end
            s3: begin
                main_red = 1;    // Main road red
                side_yellow = 1; // Side road yellow
            end
            default: begin
                main_red = 0;
                main_yellow = 0;
                main_green = 0;
                side_red = 0;
                side_yellow = 0;
                side_green = 0;
            end  
        endcase
    end

endmodule

