# Full Adder

## How it works

This project implements a 1-bit Full Adder using Verilog HDL.

The Full Adder has three inputs:

- A
- B
- Cin

The circuit has two outputs:

- Sum
- Cout

The Boolean equations are:

Sum = A XOR B XOR Cin

Cout = (A AND B) OR (A AND Cin) OR (B AND Cin)

The Tiny Tapeout input and output pins are mapped as follows:

- ui_in[0] = A
- ui_in[1] = B
- ui_in[2] = Cin
- uo_out[0] = Sum
- uo_out[1] = Cout

The remaining pins are unused.

## How to test

The Full Adder is tested using a Cocotb testbench.

All eight possible combinations of A, B, and Cin are tested.

The expected results are:

| A | B | Cin | Sum | Cout |
|---|---|-----|-----|------|
| 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 1 | 0 |
| 0 | 1 | 0 | 1 | 0 |
| 0 | 1 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 | 0 |
| 1 | 0 | 1 | 0 | 1 |
| 1 | 1 | 0 | 0 | 1 |
| 1 | 1 | 1 | 1 | 1 |

The simulation passes when the actual outputs match the expected outputs for all eight input combinations.

## External hardware

No external hardware is required.

The design is simulated using the Tiny Tapeout HDL simulation environment.
