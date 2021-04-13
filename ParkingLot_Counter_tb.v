`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2021 07:13:28 PM
// Design Name: 
// Module Name: ParkingLot_Counter_tb
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


module ParkingLot_Counter_tb(

    );
    reg A,B,reset_n;
    reg clk;
    wire [7:0] AN;
    wire DP;
    wire [6:0] SEG;
    
    ParkingLot_Counter uut (
        .A(A),
        .B(B),
        .reset_n(reset_n),
        .CLK100MHZ(clk),
        .AN(AN),
        .DP(DP),
        .SEG(SEG)
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
