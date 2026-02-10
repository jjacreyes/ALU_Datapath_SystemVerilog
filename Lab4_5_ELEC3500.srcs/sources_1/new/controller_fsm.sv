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
    typedef enum logic [2:0] {
        S_INIT = 3'b000, 
        S_WAIT = 3'b001, 
        S_CHECK = 3'b010, 
        S_ADD = 3'b011,
        S_UPDATE = 3'b100, 
        S_MODE_CHECK = 3'b101, 
        S_DONE = 3'b110
        }state_t;
    
    
    state_t current_state, next_state;
    
    // Reset Logic
    always_ff @ (posedge clk or posedge rst) begin
        if (!rst) begin
            current_state <= S_INIT; // Default state
        end
        else begin
            current_state <= next_state;
        end
    end

    // Block 2: Next State Logic
    always_comb begin
        next_state = current_state;
        case(current_state)
            S_INIT: next_state = S_WAIT;
            S_WAIT: begin
                if (step) next_state = S_CHECK;
                else next_state = S_WAIT;
            end
            S_CHECK: begin
                if (greater_than) next_state = S_DONE;
                else next_state = S_ADD;
            end
            S_ADD: next_state = S_UPDATE;
            S_UPDATE: next_state = S_MODE_CHECK;
            S_MODE_CHECK: begin
                if (mode) next_state = S_CHECK;
                else next_state = S_WAIT;
            end
            S_DONE:begin
                if (rst) next_state = S_INIT;
                else next_state = S_WAIT;
                end
            default: next_state = S_WAIT;
            endcase     
        end       

        // Block 3: Output Logic for control signals
        always_comb begin
            m1_sel = 1'b0; // Assign the default values for outputs!!!
            m2_sel = 1'b0;
            r1_ld = 1'b0;
            r2_ld = 1'b0;
            r3_ld = 1'b0;

            case(current_state)
                S_INIT: begin
                    m1_sel = 1'b0;
                    m2_sel = 1'b0;
                    r1_ld = 1'b0;
                    r2_ld = 1'b0;
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
                    r1_ld = 1'b0;
                    r2_ld = 1'b0;
                    r3_ld = 0;
                end
                S_DONE: begin  
                    r1_ld = 1'b0;
                    r2_ld = 1'b0;
                    r3_ld = 1'b0;
                end
                endcase 
        end
        
                
            
endmodule
