`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2026 09:26:30 AM
// Design Name: 
// Module Name: multiplexer_tb
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


module multiplexer_tb();

    logic in_0;
    logic in_1;
    logic sel;
    logic out;

    multiplexer dut(
        .in_0(in_0),
        .in_1(in_1),
        .sel(sel),
        .mux_out(out)
    );

    initial begin
        in_0 = 0;
        in_1 = 1;
    
        sel = 1;
        #20;
        sel = 0;
        #20;
        sel = 1;
        #20;
        sel = 1;
        #20;
        sel = 0;
    end




endmodule
