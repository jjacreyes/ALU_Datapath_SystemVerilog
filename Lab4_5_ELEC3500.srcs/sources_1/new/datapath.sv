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


module datapath #(parameter WIDTH = 11)
    (
        input logic clk, rst,
        input logic m1_sel, m2_sel,
        input logic r1_load, r2_load, r3_load,
        output logic gt,
        output logic [WIDTH-1:0] fib_out
    );

    logic [WIDTH-1:0] m1_out, m2_out;
    logic [WIDTH-1:0] r1, r2, r3;
    logic [WIDTH-1:0] sum;


    // Multiplexers
    multiplexer #(.WIDTH(WIDTH)) M1 
    (
        .in0({WIDTH{1'b0}}),
        .in1(r2),
        .sel(m1_sel),
        .out(m1_out)
    );

    multiplexer #(.WIDTH(WIDTH)) M2
    (
        .in0({WIDTH{1'b1}}),
        .in1(sum),
        .sel(m2_sel),
        .out(m2_out)
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
        else if (r1_load) begin
            r2 <= m2_out; 
        end
    end

    // Adder

    adder #(.WIDTH(WIDTH)) adder
    (
        .r1(A),
        .r2(B),
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
            fib_out <= r3;
        end
    end

    // Comparator
    comparator #(.WIDTH(WIDTH)) comp
    (
        .sum(comp_in),
        .gt(is_greater)
    );

    // Outputs: fib_out, gt
    







endmodule
