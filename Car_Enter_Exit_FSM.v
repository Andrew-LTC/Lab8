`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2021 03:17:01 PM
// Design Name: 
// Module Name: Car_Enter_Exit_FSM
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


module Car_Enter_Exit_FSM(
    input clk, reset_n, A, B,
    output car_enter, car_exit
    );
    
    reg [3:0] state_reg, state_next;
    localparam  s0 = 0, s1 = 1, s2 = 2, 
                s3 = 3, s4 = 4, s5 = 5, 
                s6 = 6, s7 = 7, s8 = 8;
                
    //State Register
    always @(posedge clk, negedge reset_n)
    begin
        if(~reset_n)
            state_reg <= s0;
        else
            state_reg <= state_next;
    end         
    
    //Next State Logic
    always @(*)
    begin
        case(state_reg)
            s0: if (A & ~B)         state_next = s1;
                else if (~A & B)    state_next = s5;
                else                state_next = s0;             
            s1: if (A & B)          state_next = s2;    //prioritize next state
                else if (A & ~B)    state_next = s1;    //then current state
                else                state_next = s0;
            s2: if (~A & B)         state_next = s3;    //prioritize next state
                else if (A & B)     state_next = s2;    //then current state
                else if (A & ~B)    state_next = s1;    //then previous state
                else                state_next = s0;    
            s3: if (~A & ~B)        state_next = s4;    
                else if (~A & B)    state_next = s3;
                else if (A & B)     state_next = s2;
                else                state_next = s0;
            s4: state_next = s0;                        
            s5: if (A & B)          state_next = s6;    
                else if (~A & B)    state_next = s5;
                else                state_next = s0; 
            s6: if (A & ~B)         state_next = s7;    
                else if (A & B)     state_next = s6;
                else if (~A & B)    state_next = s5;
                else                state_next = s0; 
            s7: if (~A & ~B)        state_next = s8;
                else if (A & ~B)    state_next = s7;
                else if (A & B)     state_next = s6;
                else                state_next = s0; 
            s8: state_next = s0;
            default: state_next = state_reg;
        endcase
    end 
    
    //Output Logic
    assign car_enter = (state_reg == s4);
    assign car_exit = (state_reg == s8);
endmodule
