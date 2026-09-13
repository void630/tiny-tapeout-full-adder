import cocotb

@cocotb.test()
async def test_full_adder(dut):

    # Test all 8 combinations of A, B, and Cin
    test_vectors = [
        (0, 0, 0, 0, 0),
        (0, 0, 1, 1, 0),
        (0, 1, 0, 1, 0),
        (0, 1, 1, 0, 1),
        (1, 0, 0, 1, 0),
        (1, 0, 1, 0, 1),
        (1, 1, 0, 0, 1),
        (1, 1, 1, 1, 1),
    ]

    for A, B, Cin, expected_sum, expected_cout in test_vectors:

        # Put A, B and Cin into ui_in[2:0]
        dut.ui_in.value = (Cin << 2) | (B << 1) | A

        # Wait for combinational logic to update
        await cocotb.triggers.Timer(1, units="ns")

        # Read outputs
        Sum = int(dut.uo_out.value) & 1
        Cout = (int(dut.uo_out.value) >> 1) & 1

        # Check results
        assert Sum == expected_sum, (
            f"Wrong SUM: A={A}, B={B}, Cin={Cin}, "
            f"expected={expected_sum}, got={Sum}"
        )

        assert Cout == expected_cout, (
            f"Wrong COUT: A={A}, B={B}, Cin={Cin}, "
            f"expected={expected_cout}, got={Cout}"
        )

        dut._log.info(
            f"A={A} B={B} Cin={Cin} "
            f"-> Sum={Sum} Cout={Cout} PASS"
        )
