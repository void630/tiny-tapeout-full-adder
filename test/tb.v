`timescale 1ns / 1ps

module tb;

    reg  [7:0] ui_in;
    wire [7:0] uo_out;
    reg  [7:0] uio_in;
    wire [7:0] uio_out;
    wire [7:0] uio_oe;
    reg        ena;
    reg        clk;
    reg        rst_n;

    // Instantiate Full Adder
    tt_um_full_adder user_project (
        .ui_in   (ui_in),
        .uo_out  (uo_out),
        .uio_in  (uio_in),
        .uio_out (uio_out),
        .uio_oe  (uio_oe),
        .ena     (ena),
        .clk     (clk),
        .rst_n   (rst_n)
    );

    // Clock
    always #5 clk = ~clk;

    initial begin

        // Initial values
        ui_in  = 8'b00000000;
        uio_in = 8'b00000000;
        ena    = 1'b1;
        clk    = 1'b0;
        rst_n  = 1'b0;

        // Reset
        #20;
        rst_n = 1'b1;

        // Test all input combinations

        // A=0 B=0 Cin=0
        ui_in = 8'b00000000;
        #10;

        // A=1 B=0 Cin=0
        ui_in = 8'b00000001;
        #10;

        // A=0 B=1 Cin=0
        ui_in = 8'b00000010;
        #10;

        // A=1 B=1 Cin=0
        ui_in = 8'b00000011;
        #10;

        // A=0 B=0 Cin=1
        ui_in = 8'b00000100;
        #10;

        // A=1 B=0 Cin=1
        ui_in = 8'b00000101;
        #10;

        // A=0 B=1 Cin=1
        ui_in = 8'b00000110;
        #10;

        // A=1 B=1 Cin=1
        ui_in = 8'b00000111;
        #10;

        $finish;

    end

endmodule
