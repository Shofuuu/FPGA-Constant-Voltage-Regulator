`timescale 1ns / 1ps

module voltage_data#(parameter FREQ_COUNT = 250)(clock, resetn, xadc_data, voltage);

    // Inputs
    input clock;
    input resetn;
    input [15:0] xadc_data;
    
    // Output
    output [11:0] voltage;
    
    // Internal registers
    reg [31:0] data = 0;
    reg [11:0] result = 0;

    reg [7:0] counter = 0;
    reg [9:0] freq_count = 0;
    
    localparam N_SAMPLES = 64;

    always @ (posedge(clock)) begin
        if (!resetn) begin
            data <= 0;
            result <= 0;
            freq_count <= 0;
        end
        else begin
            if (freq_count < FREQ_COUNT)
                freq_count <= freq_count + 1;
            else begin
                if (counter < N_SAMPLES) begin
                    data <= data + xadc_data[15:4];
                    counter <= counter + 1;
                end
                else begin
                    result <= data/N_SAMPLES;
                    data <= 0;
                    counter <= 0;
                end
                
                freq_count <= 0;
            end
        end
    end

    assign voltage = result;

endmodule
