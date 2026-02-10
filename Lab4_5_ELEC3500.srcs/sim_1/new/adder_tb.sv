`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2026 12:21:14 PM
// Design Name: 
// Module Name: adder_tb
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


module adder_tb();
    parameter WIDTH = 11;
    
    logic clk; 
    logic [WIDTH-1:0] A;
    logic [WIDTH-1:0] B;
    logic [WIDTH-1:0] sum;
    logic overflow;
    
    adder dut(
        .A(A),
        .B(B),
        .sum(sum),
        .overflow(overflow)
    );
    
    
    
    always #10 clk = ~clk;
    
    initial begin
        clk = 0;

        // Inital values
        A = 11'd0;
        B = 11'd0;
        sum = 11'd0;
        overflow = 1'b0;


        #20;
        A = 11'd500;
        B = 11'd500; // overflow = 0

        #20;
        A = 11'd1000;
        B = 11'd597; // Overflow = 1

        #20;

        $finish;  

    end
endmodule
