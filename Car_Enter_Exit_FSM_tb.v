`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2021 12:02:16 PM
// Design Name: 
// Module Name: Car_Enter_Exit_FSM_tb
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


module Car_Enter_Exit_FSM_tb(

    );
    reg clk, reset_n, A, B;
    wire car_enter, car_exit;
    
    Car_Enter_Exit_FSM uut (
        .clk(clk),
        .reset_n(reset_n),
        .A(A),
        .B(B),
        .car_enter(car_enter),
        .car_exit(car_exit)
    );
    
    localparam T = 10;
    always
    begin
        #(T/2);
        clk = 1'b0;
        #(T/2);
        clk = 1'b1;
    end
    
    initial
    begin
        reset_n = 1'b0;
        A = 1'b0;
        B = 1'b0;
        #2  
        reset_n = 1'b1;
        
        A = 1'b0;
        B = 1'b0;
        #T
        A = 1'b1;
        B = 1'b0;
        #T
        A = 1'b1;
        B = 1'b1;
        #T
        A = 1'b0;
        B = 1'b1;
        #T
        A = 1'b0;
        B = 1'b0;
        #T
        A = 1'b1;
        B = 1'b0;
        #T
        A = 1'b0;
        B = 1'b1;
        #T
        A = 1'b0;
        B = 1'b0;
        #T
        A = 1'b0;
        B = 1'b1;
        #T
        A = 1'b1;
        B = 1'b1;
        #T
        A = 1'b1;
        B = 1'b0;
        #T
        A = 1'b0;
        B = 1'b0;
        #T
        A = 1'b0;
        B = 1'b0;
        #T
        A = 1'b1;
        B = 1'b0;
        #T
        A = 1'b1;
        B = 1'b1;
        #T
        A = 1'b1;
        B = 1'b0;
        #T  
        $finish;
    end
endmodule
