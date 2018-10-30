/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  reg [15:0] value;
  
  reg [4:0] alufn;
  
  integer on;
  
  integer off;
  
  wire [16-1:0] M_combine_out;
  reg [16-1:0] M_combine_a;
  reg [16-1:0] M_combine_b;
  reg [5-1:0] M_combine_alufn;
  functionCombi_1 combine (
    .a(M_combine_a),
    .b(M_combine_b),
    .alufn(M_combine_alufn),
    .out(M_combine_out)
  );
  
  
  localparam IDLE_auto = 5'd0;
  localparam END_auto = 5'd1;
  localparam FAIL_auto = 5'd2;
  localparam ARITHMETIC_auto = 5'd3;
  localparam ADD_auto = 5'd4;
  localparam SUB_auto = 5'd5;
  localparam MUL_auto = 5'd6;
  localparam COMPARE_auto = 5'd7;
  localparam CEQ_auto = 5'd8;
  localparam CLT_auto = 5'd9;
  localparam CLE_auto = 5'd10;
  localparam BOOLEAN_auto = 5'd11;
  localparam AND_auto = 5'd12;
  localparam NAND_auto = 5'd13;
  localparam OR_auto = 5'd14;
  localparam NOR_auto = 5'd15;
  localparam XOR_auto = 5'd16;
  localparam LDR_auto = 5'd17;
  localparam SHIFT_auto = 5'd18;
  localparam SHL_auto = 5'd19;
  localparam SHR_auto = 5'd20;
  localparam SRA_auto = 5'd21;
  
  reg [4:0] M_auto_d, M_auto_q = IDLE_auto;
  
  reg [15:0] M_a_d, M_a_q = 1'h0;
  
  reg [15:0] M_b_d, M_b_q = 1'h0;
  
  reg [15:0] M_erra_d, M_erra_q = 1'h0;
  
  reg [15:0] M_errb_d, M_errb_q = 1'h0;
  
  reg [27:0] M_count_d, M_count_q = 1'h0;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_2 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  
  always @* begin
    M_auto_d = M_auto_q;
    M_erra_d = M_erra_q;
    M_errb_d = M_errb_q;
    M_count_d = M_count_q;
    M_b_d = M_b_q;
    M_a_d = M_a_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    value[0+7-:8] = io_dip[0+7-:8];
    value[8+7-:8] = io_dip[8+7-:8];
    alufn = io_dip[16+0+4-:5];
    on = 8'hff;
    off = 8'h00;
    M_combine_a = M_a_q;
    M_combine_b = M_b_q;
    M_combine_alufn = io_dip[16+0+4-:5];
    io_led[0+7-:8] = M_combine_out[0+7-:8];
    io_led[8+7-:8] = M_combine_out[8+7-:8];
    io_led[16+0+4-:5] = io_dip[16+0+4-:5];
    io_led[16+6+1-:2] = io_dip[16+6+1-:2];
    if (io_dip[16+7+0-:1] == 1'h1 & io_dip[16+6+0-:1] == 1'h0) begin
      M_a_d = value;
      M_erra_d = M_a_q;
      io_led[0+7-:8] = M_a_q[0+7-:8];
      io_led[8+7-:8] = M_a_q[8+7-:8];
    end else begin
      if (io_dip[16+6+0-:1] == 1'h1 & io_dip[16+7+0-:1] == 1'h0) begin
        M_b_d = value;
        M_errb_d = M_b_q;
        io_led[0+7-:8] = M_b_q[0+7-:8];
        io_led[8+7-:8] = M_b_q[8+7-:8];
      end
    end
    M_count_d = M_count_q + 1'h1;
    
    case (M_auto_q)
      IDLE_auto: begin
        led = on;
      end
      END_auto: begin
        led = 8'hc3;
      end
      FAIL_auto: begin
        if (M_count_q[26+0-:1] == 1'h1) begin
          led = on;
        end
      end
      ARITHMETIC_auto: begin
        if (M_count_q[26+0-:1] == 1'h1) begin
          M_count_d = 1'h0;
          M_auto_d = ADD_auto;
        end
      end
      ADD_auto: begin
        M_combine_alufn = 5'h10;
        if (M_count_q[26+0-:1] == 1'h1) begin
          M_count_d = 1'h0;
          if ((M_erra_q + M_errb_q) != (M_a_q + M_b_q)) begin
            M_auto_d = FAIL_auto;
          end else begin
            M_auto_d = SUB_auto;
          end
        end
      end
      SUB_auto: begin
        M_combine_alufn = 5'h11;
        if (M_count_q[26+0-:1] == 1'h1) begin
          M_count_d = 1'h0;
          if ((M_erra_q - M_errb_q) != (M_a_q - M_b_q)) begin
            M_auto_d = FAIL_auto;
          end else begin
            M_auto_d = MUL_auto;
          end
        end
      end
      MUL_auto: begin
        M_combine_alufn = 5'h1f;
        if (M_count_q[26+0-:1] == 1'h1) begin
          M_count_d = 1'h0;
          if ((M_erra_q * M_errb_q) != (M_a_q * M_b_q)) begin
            M_auto_d = FAIL_auto;
          end else begin
            M_auto_d = END_auto;
          end
        end
      end
      COMPARE_auto: begin
        if (M_count_q[26+0-:1] == 1'h1) begin
          M_count_d = 1'h0;
          M_auto_d = CEQ_auto;
        end
      end
      CEQ_auto: begin
        M_combine_alufn = 5'h1b;
        if (M_count_q[26+0-:1] == 1'h1) begin
          M_count_d = 1'h0;
          if ((M_erra_q == M_errb_q) != (M_a_q == M_b_q)) begin
            M_auto_d = FAIL_auto;
          end else begin
            M_auto_d = CLT_auto;
          end
        end
      end
      CLT_auto: begin
        M_combine_alufn = 5'h1c;
        if (M_count_q[26+0-:1] == 1'h1) begin
          M_count_d = 1'h0;
          if ((M_erra_q < M_errb_q) != (M_a_q < M_b_q)) begin
            M_auto_d = FAIL_auto;
          end else begin
            M_auto_d = CLE_auto;
          end
        end
      end
      CLE_auto: begin
        M_combine_alufn = 5'h1d;
        if (M_count_q[26+0-:1] == 1'h1) begin
          M_count_d = 1'h0;
          if ((M_erra_q <= M_errb_q) != (M_a_q == M_b_q)) begin
            M_auto_d = FAIL_auto;
          end else begin
            M_auto_d = END_auto;
          end
        end
      end
      BOOLEAN_auto: begin
        if (M_count_q[26+0-:1] == 1'h1) begin
          M_count_d = 1'h0;
          M_auto_d = AND_auto;
        end
      end
      AND_auto: begin
        M_combine_alufn = 5'h12;
        if (M_count_q[26+0-:1] == 1'h1) begin
          M_count_d = 1'h0;
          if ((M_erra_q & M_errb_q) != (M_a_q & M_b_q)) begin
            M_auto_d = FAIL_auto;
          end else begin
            M_auto_d = NAND_auto;
          end
        end
      end
      NAND_auto: begin
        M_combine_alufn = 5'h13;
        if (M_count_q[26+0-:1] == 1'h1) begin
          M_count_d = 1'h0;
          if (~(M_erra_q & M_errb_q) != ~(M_a_q & M_b_q)) begin
            M_auto_d = FAIL_auto;
          end else begin
            M_auto_d = OR_auto;
          end
        end
      end
      OR_auto: begin
        M_combine_alufn = 5'h14;
        if (M_count_q[26+0-:1] == 1'h1) begin
          M_count_d = 1'h0;
          if ((M_erra_q | M_errb_q) != (M_a_q | M_b_q)) begin
            M_auto_d = FAIL_auto;
          end else begin
            M_auto_d = NOR_auto;
          end
        end
      end
      NOR_auto: begin
        M_combine_alufn = 5'h15;
        if (M_count_q[26+0-:1] == 1'h1) begin
          M_count_d = 1'h0;
          if (~(M_erra_q | M_errb_q) != ~(M_a_q | M_b_q)) begin
            M_auto_d = FAIL_auto;
          end else begin
            M_auto_d = XOR_auto;
          end
        end
      end
      XOR_auto: begin
        M_combine_alufn = 5'h16;
        if (M_count_q[26+0-:1] == 1'h1) begin
          M_count_d = 1'h0;
          if ((M_erra_q ^ M_errb_q) != (M_a_q ^ M_b_q)) begin
            M_auto_d = FAIL_auto;
          end else begin
            M_auto_d = LDR_auto;
          end
        end
      end
      LDR_auto: begin
        M_combine_alufn = 5'h17;
        if (M_count_q[26+0-:1] == 1'h1) begin
          M_count_d = 1'h0;
          if (M_erra_q != M_a_q) begin
            M_auto_d = FAIL_auto;
          end else begin
            M_auto_d = END_auto;
          end
        end
      end
      SHIFT_auto: begin
        if (M_count_q[26+0-:1] == 1'h1) begin
          M_count_d = 1'h0;
          M_auto_d = SHL_auto;
        end
      end
      SHL_auto: begin
        M_combine_alufn = 5'h18;
        if (M_count_q[26+0-:1] == 1'h1) begin
          M_count_d = 1'h0;
          M_auto_d = SHR_auto;
        end
      end
      SHR_auto: begin
        M_combine_alufn = 5'h19;
        if (M_count_q[26+0-:1] == 1'h1) begin
          M_count_d = 1'h0;
          M_auto_d = SRA_auto;
        end
      end
      SRA_auto: begin
        M_combine_alufn = 5'h1a;
        if (M_count_q[26+0-:1] == 1'h1) begin
          M_count_d = 1'h0;
          M_auto_d = END_auto;
        end
      end
    endcase
    if (io_button[0+0-:1]) begin
      M_count_d = 1'h0;
      M_auto_d = ARITHMETIC_auto;
    end
    if (io_button[2+0-:1]) begin
      M_count_d = 1'h0;
      M_auto_d = COMPARE_auto;
    end
    if (io_button[3+0-:1]) begin
      M_count_d = 1'h0;
      M_auto_d = BOOLEAN_auto;
    end
    if (io_button[4+0-:1]) begin
      M_count_d = 1'h0;
      M_auto_d = SHIFT_auto;
    end
    if (io_button[1+0-:1]) begin
      M_a_d = ~(M_a_q - M_b_q);
      M_b_d = ~M_b_q - 1'h1;
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_erra_q <= 1'h0;
    end else begin
      M_erra_q <= M_erra_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_auto_q <= 1'h0;
    end else begin
      M_auto_q <= M_auto_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_a_q <= 1'h0;
    end else begin
      M_a_q <= M_a_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_b_q <= 1'h0;
    end else begin
      M_b_q <= M_b_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_count_q <= 1'h0;
    end else begin
      M_count_q <= M_count_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_errb_q <= 1'h0;
    end else begin
      M_errb_q <= M_errb_d;
    end
  end
  
endmodule
