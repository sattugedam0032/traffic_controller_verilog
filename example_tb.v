`include "example.v"
`timescale 1ns / 1ps

module example_tb;
  
  // Inputs
  reg clock;
  reg clear;
  reg a1, a2, a3;
  reg b1, b2, b3;
  reg c1, c2, c3;
  reg d1, d2, d3;
  reg ss1, ss2, ss3, ss4;
  
  // Outputs
  wire [11:0] ID;
  wire [5:0] state;
  wire [5:0] next_state;
  wire [2:0] maxout;
  
  // Instantiate the Unit Under Test (UUT)
  example uut (
    .ID(ID), 
    .clock(clock), 
    .state(state), 
    .next_state(next_state), 
    .clear(clear), 
    .maxout(maxout), 
    .a1(a1), .a2(a2), .a3(a3),
    .b1(b1), .b2(b2), .b3(b3),
    .c1(c1), .c2(c2), .c3(c3),
    .d1(d1), .d2(d2), .d3(d3),
    .ss1(ss1), .ss2(ss2), .ss3(ss3), .ss4(ss4)
  );
  
  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock; // Toggle clock every 5 time units
  end
  
  // Test procedure
  initial begin
   
    $monitor("Time: %0d | state: %0d | next_state: %0d | ID: %b | maxout: %0d", $time, state, next_state, ID, maxout);

    
    
    #5  a1=0; a2=0;a3=0;b1=0;b2=0;b3=0;c1=0;c2=0;c3=0;d1=0;d2=0;d3=0;ss1=0;ss2=0;ss4=0;ss3 = 1;
    #5  a1 = 0; b1 = 1 ; b2 = 1 ; ss3 = 0;
    #5  a1 =1 ; b1 =0; b2 =0; c1 =1;
    #5  ss2 = 1; a1 =1;
    $finish;
  end
  
endmodule

