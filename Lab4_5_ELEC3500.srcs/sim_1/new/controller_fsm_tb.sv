`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2026 01:16:43 PM
// Design Name: 
// Module Name: controller_fsm_tb
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


module controller_fsm_tb();
    logic clk;
    logic rst;
    logic step;
    logic mode;
    logic greater_than;
    logic r1_ld;
    logic r2_ld;
    logic r3_ld;
    logic m1_sel;
    logic m2_sel;
    
    controller_fsm dut(
        .clk(clk),
        .rst(rst),
        .step(step),
        .mode(mode),
        .greater_than(greater_than),
        .r1_ld(r1_ld),
        .r2_ld(r2_ld),
        .r3_ld(r3_ld),
        .m1_sel(m1_sel),
        .m2_sel(m2_sel)
    );
    
    initial begin
    
    
    rst = 1;
    #10
    rst = 0;
    #50
    step = 1;
    #50 
    greater_than = 1;
    #100
    mode = 0;
    #50
    mode = 1;
    #50
    rst = 1;
    
    end
    
    

endmodule
