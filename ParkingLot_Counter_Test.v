`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2021 01:39:28 PM
// Design Name: 
// Module Name: ParkingLot_Counter_Test
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


module ParkingLot_Counter_Test(
    input SensorA, SensorB, ResetButton,
    input CLK100MHZ,
    output [7:0] AN,
    output DP,
    output [6:0] SEG
    );
    
    //button outputs
    wire A,B,reset_n;  
    
    //buttons
    button SensA (
        .clk(CLK100MHZ),
        .in(SensorA),
        .out(A)
    );
    button SensB (
        .clk(CLK100MHZ),
        .in(SensorB),
        .out(B)
    );
    button Reset (
        .clk(CLK100MHZ),
        .in(ResetButton),
        .out(reset_n)
    );
   ParkingLot_Counter PLC (
        .A(A),
        .B(B),
        .reset_n(~reset_n),
        .CLK100MHZ(CLK100MHZ),
        .AN(AN),
        .DP(DP),
        .SEG(SEG)
   ); 
endmodule
