`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2026 12:09:11 PM
// Design Name: 
// Module Name: controller_fsm
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


module controller_fsm(
    input clk,
    input rst,
    input step,
    input mode,
    input greater_than, // from datapath module
    output logic r1_ld, 
    output logic r2_ld,
    output logic r3_ld,
    output logic m1_sel,
    output logic m2_sel
    );

    // Block 1: states
    typedef enum logic [2:0] {S_INIT = 0, S_WAIT = 1, S_CHECK = 2, S_ADD = 3, S_UPDATE = 4, S_MODE_CHECK = 5, S_DONE = 6} state_t;
    state_t current_state, next_state;

    // Block 2: Next State Logic
    always_comb begin
        next_state = S_WAIT; // Default State
        case(current_state)
            S_INIT: next_state <= S_WAIT;
            S_WAIT: begin
                if (step) begin
                    next_state <= S_CHECK;
                end
                else begin
                    next_state <= S_WAIT;
                end
            end
            S_CHECK: begin
                if (greater_than) begin
                    next_state <= S_DONE;
                end
                else begin
                    next_state <= S_ADD;
                end
            end
            S_ADD: next_state <= S_UPDATE;
            S_UPDATE: next_state <= S_MODE_CHECK;
            S_MODE_CHECK: begin
                if (mode) begin
                    next_state <= S_CHECK;
                end
                else if (!mode) begin
                    next_state <= S_WAIT;
                end
            end
            S_DONE:begin
                if (rst) begin
                    next_state <= S_INIT;
                    end                      
                end
            endcase     
        end       

        // Block 3: Output Logic for control signals
        always_comb begin
            case(current_state)
                S_INIT: begin
                    m1_sel = 1'b0;
                    m2_sel = 1'b0;
                    r1_ld = 1'b1;
                    r2_ld = 1'b1;
                end
                S_WAIT: begin
                    r1_ld = 1'b0;
                    r2_ld = 1'b0;
                end 
                S_CHECK: begin
                    r1_ld = 1'b0;
                    r2_ld = 1'b0;
                end 
                S_ADD: begin
                    r1_ld = 1'b0;
                    r2_ld = 1'b0;
                    r3_ld = 1'b1;
                end
                S_UPDATE: begin
                    m1_sel = 1'b1;
                    m2_sel = 1'b1;
                    r1_ld= 1'b1;
                    r2_ld= 1'b1;
                    r3_ld = 1'b0;
                end
                S_MODE_CHECK: begin
                    r1_ld = 0;
                    r2_ld = 0;
                    r3_ld = 0;
                end
                S_DONE: begin  
                    r1_ld = 0;
                    r2_ld = 0;
                    r3_ld = 0;
                end
                endcase 
        end
        
        // Reset Logic
        always_ff @ (posedge clk or posedge rst) begin
            if (!rst) begin
                current_state <= S_INIT; // Default state
            end
            else begin
                current_state <= next_state;
            end
        end
                
            
endmodule
