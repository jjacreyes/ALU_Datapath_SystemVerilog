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
    
    always #10 clk = ~clk;
    
initial begin
    // Initialize
    clk = 0; rst = 1; step = 0; mode = 0; greater_than = 0;
    
    #20 rst = 0; // S_INIT : r1_ld, r2_ld = 1 -> S_WAIT : 20ns
    
    #20 step = 1;   // S_WAIT -> S_CHECK : 40ns
    #20 step = 0;  // : 60ns
    
    // 80ns S_CHECK -> 
    // 100ns S_ADD : m1_sel ,m2_sel, r1_ld, r2_ld = 0, r3_ld = 1 -> 
    // 120ns S_UPDATE : m1_sel, m2_sel, r1_ld, r2_ld = 1, r3_ld = 0 -> 
    // 140ns S_MODE_CHECK (4 Clock Cycles) -> all output = 0
    #80; // : 140ns
    
    // S_MODE_CHECK, mode = 0: -> S_WAIT
    #20; // : 160ns
    
    // S_WAIT
    step = 1; // S_WAIT -> S_CHECK, all output = 0
    #20 step = 0; // :180 ns 
    greater_than = 1; // S_CHECK -> S_DONE, all output = 0
    
    #40 $finish; // : 220ns
end
    
    

endmodule
