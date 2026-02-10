`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2026 08:02:58 AM
// Design Name: 
// Module Name: comparator
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


module comparator #(parameter WIDTH = 11, parameter COMPARED_VALUE = 11'd1000)
    (
        input logic [WIDTH-1:0] comp_in,
        output logic is_greater
    );
    
    assign is_greater = (comp_in > COMPARED_VALUE);
    
endmodule
