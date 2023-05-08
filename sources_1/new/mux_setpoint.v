`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2023 12:56:58 PM
// Design Name: 
// Module Name: mux_setpoint
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


module mux_setpoint(a, b, c, d, e, f, g, h, s, y);

    // Inputs
    input [11:0] a, b, c, d, e, f, g, h;
    input [2:0] s;
    
    // Output
    output [11:0] y;
    
    assign y = (s == 3'b000) ? a :
               (s == 3'b001) ? b :
               (s == 3'b010) ? c :
               (s == 3'b011) ? d :
               (s == 3'b100) ? e :
               (s == 3'b101) ? f :
               (s == 3'b110) ? g :
               (s == 3'b111) ? h : a;

endmodule
