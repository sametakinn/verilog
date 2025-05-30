`timescale 1ns / 1ps

module BRAM #(
    parameter RAM_WIDHT = 16,
    parameter RAM_DEPTH = 1024
)
(
    input                               clk,
    input                               we_i,
    input                               re_i,
    input      [$clog2(RAM_DEPTH)-1:0]  addr_i,
    input      [RAM_WIDHT-1:0]          din_i,
    output reg [RAM_WIDHT-1:0]          dout_o
    );
    
    (* ram_style = "block" *)
    reg [RAM_WIDHT-1:0] RAM [0:RAM_DEPTH-1] ;
    
    always @(posedge clk)begin 
        if (we_i)begin
            RAM[addr_i]<= din_i;
        end else if (re_i)begin
            dout_o <= RAM[addr_i];
        end
    end
    
endmodule
