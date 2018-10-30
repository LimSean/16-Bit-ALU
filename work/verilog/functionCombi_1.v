/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module functionCombi_1 (
    input [15:0] a,
    input [15:0] b,
    input [4:0] alufn,
    output reg [15:0] out
  );
  
  
  
  wire [16-1:0] M_adder_out;
  reg [16-1:0] M_adder_a;
  reg [16-1:0] M_adder_b;
  reg [5-1:0] M_adder_alufn;
  adder16_3 adder (
    .a(M_adder_a),
    .b(M_adder_b),
    .alufn(M_adder_alufn),
    .out(M_adder_out)
  );
  
  wire [16-1:0] M_bool_out;
  reg [16-1:0] M_bool_a;
  reg [16-1:0] M_bool_b;
  reg [5-1:0] M_bool_alufn;
  boole16_4 bool (
    .a(M_bool_a),
    .b(M_bool_b),
    .alufn(M_bool_alufn),
    .out(M_bool_out)
  );
  
  wire [16-1:0] M_cmp_out;
  reg [16-1:0] M_cmp_a;
  reg [16-1:0] M_cmp_b;
  reg [5-1:0] M_cmp_alufn;
  compare16_5 cmp (
    .a(M_cmp_a),
    .b(M_cmp_b),
    .alufn(M_cmp_alufn),
    .out(M_cmp_out)
  );
  
  wire [16-1:0] M_shift_out;
  reg [16-1:0] M_shift_a;
  reg [16-1:0] M_shift_b;
  reg [5-1:0] M_shift_alufn;
  shift16_6 shift (
    .a(M_shift_a),
    .b(M_shift_b),
    .alufn(M_shift_alufn),
    .out(M_shift_out)
  );
  
  wire [16-1:0] M_mul_out;
  reg [16-1:0] M_mul_a;
  reg [16-1:0] M_mul_b;
  reg [5-1:0] M_mul_alufn;
  multiply16_7 mul (
    .a(M_mul_a),
    .b(M_mul_b),
    .alufn(M_mul_alufn),
    .out(M_mul_out)
  );
  
  always @* begin
    out = 1'h0;
    M_adder_a = a;
    M_adder_b = b;
    M_adder_alufn = alufn;
    M_bool_a = a;
    M_bool_b = b;
    M_bool_alufn = alufn;
    M_cmp_a = a;
    M_cmp_b = b;
    M_cmp_alufn = alufn;
    M_shift_a = a;
    M_shift_b = b;
    M_shift_alufn = alufn;
    M_mul_a = a;
    M_mul_b = b;
    M_mul_alufn = alufn;
    
    case (alufn)
      5'h10: begin
        out = M_adder_out;
      end
      5'h11: begin
        out = M_adder_out;
      end
      5'h12: begin
        out = M_bool_out;
      end
      5'h13: begin
        out = M_bool_out;
      end
      5'h14: begin
        out = M_bool_out;
      end
      5'h15: begin
        out = M_bool_out;
      end
      5'h16: begin
        out = M_bool_out;
      end
      5'h17: begin
        out = M_bool_out;
      end
      5'h18: begin
        out = M_shift_out;
      end
      5'h19: begin
        out = M_shift_out;
      end
      5'h1a: begin
        out = M_shift_out;
      end
      5'h1b: begin
        out = M_cmp_out;
      end
      5'h1c: begin
        out = M_cmp_out;
      end
      5'h1d: begin
        out = M_cmp_out;
      end
      5'h1f: begin
        out = M_mul_out;
      end
    endcase
  end
endmodule
