`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2021 12:17:04 PM
// Design Name: 
// Module Name: ParkingLot_Counter
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


module ParkingLot_Counter(
    input A,B,reset_n,
    input CLK100MHZ,
    output [7:0] AN,
    output DP, 
    output [6:0] SEG
    );
    
    //FSM outputs
    wire car_enter, car_exit;
    
    //Counter output
    wire [7:0] CounterOut;
    wire [11:0] BCDout;
    
    //Car Sensor
    Car_Enter_Exit_FSM SensorsAB (
        .clk(CLK100MHZ),
        .reset_n(reset_n),
        .A(A),
        .B(B),
        .car_enter(car_enter),
        .car_exit(car_exit)
    );
    //Car Counter
    udl_counter #(.BITS(8)) CarCounter (
        .clk(CLK100MHZ),
        .reset_n(reset_n),
        .enable(car_enter ^ car_exit),  //as shown with TT and Kmap
        .up(car_enter),                 //as shown with TT and Kmap
        .Q(CounterOut)
    );
    bin2bcd BCD (
        .bin(CounterOut),
        .bcd(BCDout)    
    );
    //Display Driver
    sseg_driver Display (
        .I7(6'b0),
        .I6(6'b0),
        .I5(6'b0),
        .I4(6'b0),
        .I3(6'b0),
        .I2({1'b1,BCDout[11:8],1'b0}),
        .I1({1'b1,BCDout[7:4],1'b0}),
        .I0({1'b1,BCDout[3:0],1'b0}),
        .CLK100MHZ(CLK100MHZ),
        .SSEG(SEG),
        .AN(AN),
        .DP(DP)
    );
endmodule
