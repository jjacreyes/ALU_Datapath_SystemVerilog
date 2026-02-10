`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2026 09:11:47 AM
// Design Name: 
// Module Name: comparator_tb
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


module comparator_tb();

    parameter CLOCK_PERIOD = 10; // 10ns for 100MHz clk
    parameter WIDTH = 11;

    logic [WIDTH-1:0] comp_in;
    logic is_greater_output;

    comparator dut(
        .comp_in(comp_in),
        .is_greater(is_greater_output)
    );

    initial begin
        comp_in = 11'd500;
        #20;
        comp_in = 11'd1000;
        #20;
        comp_in = 11'd1001;
        #20;
        comp_in = 11'd200;
    end



endmodule
