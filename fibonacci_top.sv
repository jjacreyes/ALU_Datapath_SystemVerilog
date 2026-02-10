`timescale 1ns / 1ps

module fibonacci_top #(parameter FIB_WIDTH = /* TODO: Enter required bit width */) 
(
    input wire i_sys_clk,
    input wire i_sys_rst,
    input wire i_step,
    input wire i_mode,
    output wire [FIB_WIDTH-1:0] o_fibonacci
);

    /*========================= DO NOT EDIT BEGINS ===============================*/
    /*========================= DO NOT EDIT BEGINS ===============================*/
    /*========================= DO NOT EDIT BEGINS ===============================*/
    logic clk, rst;
    logic locked;
    (* async_reg = "true" *) logic mode_sync, mode;
    logic step;

    // Instantiate Clock Generator
    clk_wiz_0 clk_gen (
        .clk_in1(i_sys_clk),
        .reset(i_sys_rst),
        .locked(locked),
        .clk_out1(clk)
    );

    proc_sys_reset_0 rst_gen
    (
      .slowest_sync_clk(clk),
      .ext_reset_in(i_sys_rst),
      .aux_reset_in('0),
      .mb_debug_sys_rst('0),
      .dcm_locked(locked),    
      .mb_reset(),
      .bus_struct_reset(),
      .peripheral_reset(rst),
      .interconnect_aresetn(), 
      .peripheral_aresetn() 
    );

    // Debounce step input button
    debouncer #(
        .DEBOUNCE_COUNT(500_000)
    ) step_db (
        .i_clk(clk),
        .i_rst(rst),
        .i_btn_in(i_step),
        .o_btn_out(step)
    );

    // 2 stage synchronizer for switch input
    always_ff @(posedge clk) begin
        mode_sync <= i_mode;
        mode      <= mode_sync;
    end
    /*========================= DO NOT EDIT ENDS ===============================*/
    /*========================= DO NOT EDIT ENDS ===============================*/
    /*========================= DO NOT EDIT ENDS ===============================*/


    // TODO: Instantiate your fibonacci core here (example shown)
    // Use signals clk, rst, step, mode, o_fibonacci
    fibonacci #(
        .W(FIB_WIDTH)
    ) fib_core (
        .clk(clk),
        .rst(rst),
        // etc
    );

    // TODO: Connect ILA probes to signals (example shown)
    ila_0 ila_inst (
        .clk(clk),
        .probe0(step),
        .probe1(mode),
        .probe2(),
        .probe3(),
        // etc
    );


endmodule
