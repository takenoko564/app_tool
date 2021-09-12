`default_nettype none

module embed_seq32_apb(
  clk_i,
  rstn_i,
  paddr_o,
  psel_o,
  penable_o,
  pwrite_o,
  pwdata_o,
  pready_i,
  prdata_i,
  irq_o
);

  parameter   P_REG_NUM = 32'd1; // 0=2reg, 1=4reg, 2=8reg
  parameter   P_IRQ_NUM = 32'd1;  // From 1 to 24
  localparam  P_ADDR_WIDTH = 32'd32;
  localparam  P_DATA_WIDTH = 32'd32;

  input wire                       clk_i;
  input wire                       rstn_i;
  output wire [P_ADDR_WIDTH - 1:0] paddr_o;
  output wire                      psel_o;
  output wire                      penable_o;
  output wire                      pwrite_o;
  output wire [P_DATA_WIDTH - 1:0] pwdata_o;
  input wire                       pready_i;
  input wire [P_DATA_WIDTH - 1:0]  prdata_i;
  output wire [P_IRQ_NUM-1:0]      irq_o;

  wire [31:0]                      code;
  wire [P_ADDR_WIDTH-1:0]          addr;
  wire                             ack;
  wire [P_DATA_WIDTH-1:0]          wdata;
  wire [P_DATA_WIDTH-1:0]          rdata;
  wire                             wvalid;
  wire                             rvalid;

  embed_seq32_core #(
    .P_REG_NUM(P_REG_NUM),
    .P_IRQ_NUM(P_IRQ_NUM)
  ) i_emved_seq32_core (
    .clk_i    (clk_i  ),
    .rstn_i   (rstn_i ),
    .wvalid_o (wvalid ),
    .wdata_o  (wdata  ),
    .rvalid_o (rvalid ),
    .rdata_i  (rdata  ),
    .addr_o   (addr   ),
    .ack_i    (ack    ),
    .irq_o    (irq_o  )
  );

  embed_seq32_apb_mst #(
    .P_ADDR_WIDTH(P_ADDR_WIDTH),
    .P_DATA_WIDTH(P_DATA_WIDTH)
  ) i_embed_seq32_apb_mst (
    .clk_i    (clk_i    ),
    .rstn_i   (rstn_i   ),
    .wvalid_i (wvalid   ),
    .wdata_i  (wdata    ),
    .rvalid_i (rvalid   ),
    .rdata_o  (rdata    ),
    .addr_i   (addr     ),
    .ack_o    (ack      ),
    .paddr_o  (paddr_o  ),
    .psel_o   (psel_o   ),
    .penable_o(penable_o),
    .pwrite_o (pwrite_o ),
    .pwdata_o (pwdata_o ),
    .pready_i (pready_i ),
    .prdata_i (prdata_i )
  );

endmodule
`default_nettype wire
