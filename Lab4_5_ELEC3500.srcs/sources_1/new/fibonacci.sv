`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2026 09:58:23 AM
// Design Name: 
// Module Name: fibonacci
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module fibonacci #(parameter WIDTH = 11)
    (
        input logic clk, rst,
        input logic step, mode,
        output wire GT,
        output logic [WIDTH-1:0]o_fibonacci //10 bit output 
    );

    wire m1_sel_out, m2_sel_out;
    wire r1_ld_out, r2_ld_out, r3_ld_out;

    // Controller FSM 
    controller_fsm controller (
        .clk(clk),
        .rst(rst),
        .step(step),
        .mode(mode),
        .greater_than(GT),
        .r1_ld(r1_ld_out),
        .r2_ld(r2_ld_out),
        .r3_ld(r3_ld_out),
        .m1_sel(m1_sel_out),
        .m2_sel(m2_sel_out)
    );

    // Datapath
    datapath #(.WIDTH(WIDTH)) datapath
    (
        .clk(clk),
        .rst(rst),
        .m1_sel(m1_sel_out),
        .m2_sel(m2_sel_out),
        .r1_ld(r1_ld_out),
        .r2_ld(r2_ld_out),
        .r3_ld(r3_ld_out),
        .GT(gt),
        .o_fibonacci(fib_out)
    );


endmodule
