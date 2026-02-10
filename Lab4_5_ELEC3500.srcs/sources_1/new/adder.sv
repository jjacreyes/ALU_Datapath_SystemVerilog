`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2026 08:02:32 AM
// Design Name: 
// Module Name: adder
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


module adder #(parameter WIDTH = 11)
    (
        input logic [WIDTH-1:0] A,
        input logic [WIDTH-1:0] B,
        output logic [WIDTH-1:0] sum,
        output logic overflow //  Overflow logic for sum > 1000
    );

    assign temp_sum = A + B;
    assign sum = temp_sum[WIDTH-1:0]; // first 11 bits
    assign overflow = temp_sum[WIDTH]; // looks for 12th bit for overflow

endmodule
