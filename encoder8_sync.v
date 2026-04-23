// encoder8_sync.v
// Student task:
// Add a register stage so the encoder output is synchronized by clk.
//
// Goal:
//   - use encoder8 as the combinational encoder
//   - sample its output on posedge clk
//   - drive the final stable output from a register
//
// TODO:
//   Fill in the missing sequential logic.

module encoder8_sync (
    input        clk,
    input  [7:0] in,
    output [2:0] out_sync
);

wire [2:0] out_comb;
reg  [2:0] out_reg;

// Instantiate the original combinational encoder
encoder8 u_encoder8 (
    .in  (in),
    .out (out_comb)
);

// TODO:
// Add sequential logic here.
// Sample out_comb on the rising edge of clk
// and store it into out_reg.



assign out_sync = out_reg;

endmodule
