`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2026 11:05:16 AM
// Design Name: 
// Module Name: fibonacci_tb
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


module fibonacci_tb();
    parameter WIDTH = 11;

    logic clk;
    logic rst; 
    logic step;
    logic mode;
    logic GT;
    logic [WIDTH-1:0] o_fibonacci;


    fibonacci dut(
        .clk(clk),
        .rst(rst),
        .step(step),
        .mode(mode),
        .GT(GT),
        .o_fibonacci(o_fibonacci)


    )


endmodule
