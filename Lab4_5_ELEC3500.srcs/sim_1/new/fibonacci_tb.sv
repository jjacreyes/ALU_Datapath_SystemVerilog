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
    parameter WIDTH = 10;

    logic clk;
    logic rst; 
    logic step;
    logic mode;
    logic gt;
    logic [WIDTH-1:0] o_fibonacci;


    fibonacci dut(
        .clk(clk),
        .rst(rst),
        .step(step),
        .mode(mode),
        .o_fibonacci(o_fibonacci)
    );

    always #10 clk = ~clk; // 10MHz Clock Cycle

    initial begin
        //  Default / initial Signals
        clk = 0;
        rst = 0;
        step = 1;
        mode = 1; // Just gonna test automatic mode
        gt = 0;
        o_fibonacci = {WIDTH-1{1'b0}};

        #20; // 20ns

        rst = 1; // S_INIT
        #20; //40 ns
        rst = 0; // S_INIT -> S_WAIT
        step = 1;
        #20;
        step = 0;
        #20;
        step = 1;
        #20; // 60ns
                step = 0;
        #20;
        step = 1;
        #20; // 60ns
                step = 0;
        #20;
        step = 1;
        #20; // 60ns
                step = 0;
        #20;
        step = 1;
        #20; // 60ns
                step = 0;
        #20;
        step = 1;
        #20; // 60ns
                step = 0;
        #20;
        step = 1;
        #20; // 60ns
                step = 0;
        #20;
        step = 1;
        #20; // 60ns
                step = 0;
        #20;
        step = 1;
        #20; // 60ns
                step = 0;
        #20;
        step = 1;
        #20; // 60ns
                step = 0;
        #20;
        step = 1;
        #20; // 60ns
                step = 0;
        #20;
        step = 1;
        #20; // 60ns
                step = 0;
        #20;
        step = 1;
        #20; // 60ns
                step = 0;
        #20;
        step = 1;
        #20; // 60ns
                step = 0;
        #20;
        step = 1;
        #20; // 60ns
                step = 0;
        #20;
        step = 1;
        #20; // 60ns
                step = 0;
        #20;
        step = 1;
        #20; // 60ns
        

        
        $finish;
    end 



endmodule
