`default_nettype none

module tt_um_full_adder (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire       ena,
    input  wire       clk,
    input  wire       rst_n
);

    // Full Adder inputs
    wire A;
    wire B;
    wire Cin;

    assign A   = ui_in[0];
    assign B   = ui_in[1];
    assign Cin = ui_in[2];

    // Sum
    assign uo_out[0] = A ^ B ^ Cin;

    // Carry Out
    assign uo_out[1] =
        (A & B) |
        (A & Cin) |
        (B & Cin);

    // Unused outputs
    assign uo_out[7:2] = 6'b000000;

    // Bidirectional pins not used
    assign uio_out = 8'b00000000;
    assign uio_oe  = 8'b00000000;

endmodule

`default_nettype wire
