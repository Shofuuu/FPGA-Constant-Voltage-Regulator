`timescale 1ns / 1ps

module constant_voltage(clock, resetn, voltage, set_point, count_pwm, count_timer, count_refresh, enable_count, dir, pwm);

    // Inputs
    input clock;
    input resetn;
//    input [15:0] xadc_data;
    input [11:0] voltage;
    input [11:0] set_point;
    
    // Output
    output pwm;
    output [10:0] count_pwm;
    output [10:0] count_timer;
    output [12:0] count_refresh;
    output enable_count;
    output [1:0] dir;
    
    localparam IDLE = 2'b00;
    localparam INCREASE = 2'b01;
    localparam DECREASE = 2'b10;
    
    wire [11:0] voltage;
    reg [1:0] direction;
    
    reg [10:0] counter_pwm = 0;
    reg [10:0] counter_timer = 0;
    reg enable_counter = 0;
    
//    voltage_data voltage_data0(
//        .clock(clock),
//        .resetn(resetn),
//        .xadc_data(xadc_data),
//        .voltage(voltage)
//    );
    
//    assign direction = (set_point >= (voltage-5)) & (set_point <= (voltage+5)) ? IDLE : // if set_point is larger than increase the pwm (1) otherwise 0
//                       (set_point > (voltage+5)) ? INCREASE : DECREASE;

    // Determine the direction of PWM set
    always @ (posedge(enable_counter), negedge(resetn)) begin
        if (!resetn) begin
            direction <= IDLE;
        end
        else begin
            if ((set_point >= (voltage-5)) & (set_point <= (voltage + 10)))
                direction <= IDLE;
            else if ((set_point > (voltage+10)))
                direction <= INCREASE;
            else if ((set_point < (voltage-5)))
                direction <= DECREASE;
            else
                direction <= direction;
        end
    end

    // set counter for PWM value
    always @ (posedge(enable_counter), negedge(resetn)) begin
        if (!resetn) begin
            counter_pwm <= 0;
        end
        else begin
            case (direction)
                IDLE : counter_pwm <= counter_pwm;
                
                INCREASE : begin
                    if (counter_pwm < 1116) // max 90% pwm
                        counter_pwm <= counter_pwm + 1;
                    else
                        counter_pwm <= counter_pwm;
                end
                
                DECREASE : begin
                    if (counter_pwm > 0)
                        counter_pwm <= counter_pwm - 1;
                    else
                        counter_pwm <= counter_pwm;
                end
            endcase
        end
    end
    
    reg [12:0] refresh_count = 0;
    
    // store the pwm value at the refresh rate
    always @ (posedge(clock), negedge(resetn)) begin
        if (!resetn) begin
            refresh_count <= 0;
            enable_counter <= 0;
        end
        else begin
            if (refresh_count < 6500) begin
                refresh_count <= refresh_count + 1;
            end
            else begin
                refresh_count <= 0;
                enable_counter <= !enable_counter;
            end
        end
    end
    
    // free counter running
    always @ (posedge(clock), negedge(resetn)) begin
        if (!resetn)
            counter_timer <= 0;
        else begin
            if (counter_timer > 1240) begin
                counter_timer <= 0;
            end
            else begin
                counter_timer <= counter_timer + 1;
            end
        end
    end
    
    assign count_pwm = counter_pwm;
    assign count_timer = counter_timer;
    assign count_refresh = refresh_count;
    assign enable_count = enable_counter;
    assign dir = direction;
    
    // Output compare stored pwm value vs free counter to create pwm value
    assign pwm = ((counter_timer < counter_pwm) & (counter_timer != 0) ? 1:0);

endmodule
