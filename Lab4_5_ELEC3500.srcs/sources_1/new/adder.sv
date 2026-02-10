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


module adder #(parameter WIDTH = 10)
    (
        input logic [WIDTH:0] A,
        input logic [WIDTH:0] B,
        output logic [WIDTH:0] sum,
        output logic overflow //  Overflow logic for sum > 1000
    );
    logic [WIDTH:0] temp_sum;

    assign temp_sum = A + B;
    assign sum = temp_sum[WIDTH:0]; // first 10 bits
    assign overflow = temp_sum[WIDTH-1]; // looks for 11th bit for overflow --> WILL BE USED TO STOP IF 1!!!!

endmodule
