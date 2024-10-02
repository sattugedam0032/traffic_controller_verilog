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
   
    $monitor("Time: %0d | state: %0d | ID: %b ", $time, state, ID);

    
    
    #10 a1=1'b0; a2=1'b0; a3=1'b0;
    b1=1'b0; b2=1'b0; b3=1'b0;
    c1=1'b0; c2=1'b0; c3=1'b0;
    d1=1'b0; d2=1'b0; d3=1'b0;
    ss1=1'b0; ss2=1'b0; ss3=1'b0; ss4=1'b0;

    #10 ss3 = 1'b1; // Set ss3 high

    #10 ss3 = 1'b0; // Set ss3 low
    b1 = 1'b1;  // Set b1 high
    b2 = 1'b1;  // Set b2 high

    #10 a1 = 1'b1;  // Set a1 high
    b1 = 1'b0;  // Set b1 low
    b2 = 1'b0;  // Set b2 low
    c1 = 1'b1;  // Set c1 high

    #10 ss2 = 1'b1; // Set ss2 high
    a1 = 1'b1;  // Keep a1 high

    $finish;
  end
  
endmodule

