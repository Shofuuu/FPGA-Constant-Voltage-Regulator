`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2023 11:08:30 AM
// Design Name: 
// Module Name: voltage_data_tb
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


module voltage_data_tb;

    // registers
    reg [15:0] xadc_data;
    reg clock;
    reg resetn;
    
    wire [11:0] voltage;
    
    initial begin
        resetn <= 0;
        xadc_data <= 15'b11111111110000;
        
        clock <= 0;
        #10;
        clock <= 1;
        #10;
        clock <= 0;
        #10;
        clock <= 1;
        #10;
        
        resetn <= 1;
        
        clock <= 0;
        #10;
        clock <= 1;
        #10;
                
        xadc_data <= 15'b11111111000000;
        
        clock <= 0;
        #10;
        clock <= 1;
        #10;
                
        xadc_data <= 15'b10000000011000;
        
        clock <= 0;
        #10;
        clock <= 1;
        #10;
                        
        xadc_data <= 15'b11111110100000;
        
        clock <= 0;
        #10;
        clock <= 1;
        #10;
                
        xadc_data <= 15'b11111111110000;
        
        clock <= 0;
        #10;
        clock <= 1;
        #10;
                
        xadc_data <= 15'b10000000111000;
        
        clock <= 0;
        #10;
        clock <= 1;
        #10;
                
        xadc_data <= 15'b11111111100000;
        
        clock <= 0;
        #10;
        clock <= 1;
        #10;
                
        xadc_data <= 15'b10000000101000;
        
        clock <= 0;
        #10;
        clock <= 1;
        #10;
                
        xadc_data <= 15'b11111111010000;
        
        clock <= 0;
        #10;
        clock <= 1;
        #10;
                
        xadc_data <= 15'b1111111100000;
        
        clock <= 0;
        #10;
        clock <= 1;
        #10;
        
        clock <= 0;
        #10;
        clock <= 1;
        #10;
    end
    
    voltage_data voltage_data0(
        .clock(clock),
        .resetn(resetn),
        .xadc_data(xadc_data),
        .voltage(voltage)
    );

endmodule
