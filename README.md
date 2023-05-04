# Constant Voltage Regulator with Zybo FPGA for Controlling Buck Converter

This project demonstrates how to use the Zybo FPGA board to control a buck converter and maintain a constant output voltage using a constant voltage regulator. The buck converter is controlled using Pulse Width Modulation (PWM) with a frequency of around 100kHz.

## Hardware Requirements

- Zybo FPGA board
- Buck converter
- External power supply
- Jumpers and wires

## Software Requirements

- Vivado Design Suite
- Xilinx SDK

## Project Overview

The project consists of the following components:

1. Buck Converter: The buck converter is a DC-DC converter that converts a high voltage input to a low voltage output. The output voltage is controlled by adjusting the duty cycle of the PWM signal.

2. Zybo FPGA: The Zybo FPGA board is used to generate the PWM signal and control the buck converter. The PWM signal is generated using the FPGA's built-in hardware resources.

## How to Use the Project

1. Connect the buck converter to the Zybo FPGA board.

2. Connect the external power supply to the buck converter.

3. Open the Vivado Design Suite and create a new project.

4. Add the Zybo FPGA board as the target device.

5. Create a new VHDL design and implement the PWM generation and constant voltage regulation logic.

6. Generate a bitstream file and program the Zybo FPGA board.

7. Open the Xilinx SDK and create a new application project.

8. Write the software code to control the PWM signal and maintain the constant output voltage.

9. Compile the software code and run it on the Zybo FPGA board.

## Conclusion

This project demonstrates how to use the Zybo FPGA board and a buck converter to maintain a constant output voltage using a constant voltage regulator. By adjusting the duty cycle of the PWM signal, the output voltage can be controlled with high precision. This project can be extended to other applications that require precise voltage regulation.
