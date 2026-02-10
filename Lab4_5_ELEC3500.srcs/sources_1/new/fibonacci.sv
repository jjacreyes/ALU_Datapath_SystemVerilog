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
        output logic o_fibonacci
    );

    wire m1_sel_out, m2_sel_out;
    wire r1_ld_out, r2_ld_out, r3_ld_out;

    // Controller FSM 
    controller_fsm controller (
        .clk(clk),
        .rst(rst),
        .step(step),
        .mode(mode),
        .GT(greater_than),
        .r1_ld_out(r1_ld),
        .r2_ld_out(r2_ld),
        .r3_ld_out(r3_ld),
        .m1_sel_out(m1_sel),
        .m2_sel_out(m2_sel)
    );

    // Datapath
    datapath #(.WIDTH(WIDTH)) datapath
    (
        .clk(clk),
        .rst(rst),
        .m1_sel_out(m1_sel),
        .m2_sel_out(m2_sel),
        .r1_ld_out(r1_ld),
        .r2_ld_out(r2_ld),
        .r3_ld_out(r3_ld),
        .GT(gt),
        .o_fibonacci(fib_out)
    );



endmodule
