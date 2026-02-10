`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2026 11:13:12 AM
// Design Name: 
// Module Name: datapath
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

module datapath #(parameter WIDTH = 10)
    (
        input logic clk, rst,
        input logic m1_sel, m2_sel,
        input logic r1_load, r2_load, r3_load,
        output logic gt,
        output logic [WIDTH:0] fib_out
    );

    logic [WIDTH:0] m1_out, m2_out;
    logic [WIDTH:0] r1, r2, r3;
    logic [WIDTH:0] sum;
    logic overflow;


    // Multiplexers
    multiplexer #(.WIDTH(WIDTH)) M1 
    (
        .in_0(11'b0), // F(0) = 0
        .in_1(r2),
        .sel(m1_sel),
        .mux_out(m1_out)
    );

    multiplexer #(.WIDTH(WIDTH)) M2
    (
        .in_0(11'b1), // F(1) = 1
        .in_1(sum),
        .sel(m2_sel),
        .mux_out(m2_out)
    );

    // Register Logic

    always_ff @ (posedge clk) begin
        if (rst) begin
            r1 <= {WIDTH{1'b0}};
        end
        else if (r1_load) begin
            r1 <= m1_out; 
        end
    end

    always_ff @ (posedge clk) begin
        if (rst) begin
            r2 <= {WIDTH{1'b0}};
        end
        else if (r2_load) begin
            r2 <= m2_out; 
        end
    end

    // Adder

    adder #(.WIDTH(WIDTH)) adder
    (
        .A(r1),
        .B(r2),
        .sum(sum),
        .overflow(overflow)
    );

    // Register 3 logic
    always_ff @ (posedge clk)
    begin
        if (rst) begin
            r3 <= {WIDTH{1'b0}};
        end
        else if (r3_load) begin
            r3 <= sum;
            fib_out <= sum;
        end
    end

    // Comparator
    comparator #(.WIDTH(WIDTH)) comp
    (
        .comp_in(sum),
        .is_greater(gt)
    );

    // Outputs: fib_out, gt
    
endmodule
