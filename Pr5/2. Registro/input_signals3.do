force clk -repeat 10 ns 1, 0 5 ns
force rst 1, 0 90 ns
force we 1, 0 80 ns
force wa 2'b00, 2'b10 30 ns
force di 4'b0000, 4'b0011 10, 4'b1010 50 ns
force ra 2'b00, 2'b11 10, 2'b10 40, 2'b01 50, 2'b00 70 ns

