`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2026 08:03:28 AM
// Design Name: 
// Module Name: multiplexer
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

module multiplexer #(parameter WIDTH = 10)
(
    input wire [WIDTH:0] in_0,
    input wire [WIDTH:0] in_1,
    input wire sel,
    output logic [WIDTH:0] mux_out
);

always_ff @ (*) begin
    case(sel)
        1'b0:mux_out = in_0;
        1'b1:mux_out = in_1;
    endcase
end
endmodule
