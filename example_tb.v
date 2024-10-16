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
  integer i;
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
    forever #1 clock = ~clock; // Toggle clock every 5 time units
  end
  
  // Test procedure
  initial begin
    // Initial setup and first display after 5 time units
    // #5 
    // $display("Time: %0d | a1: %b | a2: %b | a3: %b | b1: %b | b2: %b | b3: %b | c1: %b | c2: %b | c3: %b | d1: %b | d2: %b | d3: %b | ss1: %b | ss2: %b | ss3: %b | ss4: %b | state: %0d | ID: %b",
    //          $time, a1, a2, a3, b1, b2, b3, c1, c2, c3, d1, d2, d3, ss1, ss2, ss3, ss4, state, ID);
    
    // Change inputs and display after 10 time units
    a1=1'b1; a2=1'b1; a3=1'b1;
    b1=1'b1; b2=1'b0; b3=1'b0;
    c1=1'b1; c2=1'b0; c3=1'b0;
    d1=1'b1; d2=1'b1; d3=1'b0;
    ss1=1'b0; ss2=1'b0; ss3=1'b0; ss4=1'b0;
    
    
    for(i=0; i<10; i= i+1)
       begin
        #1
        $display("Time: %0d | a1: %b | a2: %b | a3: %b | b1: %b | b2: %b | b3: %b | c1: %b | c2: %b | c3: %b | d1: %b | d2: %b | d3: %b | ss1: %b | ss2: %b | ss3: %b | ss4: %b | next_state: %0d | state: %0d | ID: %b",
             $time, a1, a2, a3, b1, b2, b3, c1, c2, c3, d1, d2, d3, ss1, ss2, ss3, ss4, next_state, state, ID);

       end
    // Set ss3 high and display after 5 more time units
    a1=1'b0; a2=1'b0; a3=1'b0;
    b1=1'b0; b2=1'b0; b3=1'b0;
    c1=1'b0; c2=1'b0; c3=1'b0;
    d1=1'b0; d2=1'b0; d3=1'b0;
    ss1=1'b0; ss2=1'b0; ss3=1'b1; ss4=1'b0;
    
        
    for(i=0; i<10; i= i+1)
       begin
        #1
        $display("Time: %0d | a1: %b | a2: %b | a3: %b | b1: %b | b2: %b | b3: %b | c1: %b | c2: %b | c3: %b | d1: %b | d2: %b | d3: %b | ss1: %b | ss2: %b | ss3: %b | ss4: %b | next_state: %0d | state: %0d | ID: %b",
             $time, a1, a2, a3, b1, b2, b3, c1, c2, c3, d1, d2, d3, ss1, ss2, ss3, ss4, next_state, state, ID);

       end
    // // Uncommented code and further changes
    
    ss3 = 1'b0; // Set ss3 low
    b1 = 1'b1;  // Set b1 high
    b2 = 1'b1;  // Set b2 high
    
      for(i=0; i<15; i= i+1)
       begin
        #1
        $display("Time: %0d | a1: %b | a2: %b | a3: %b | b1: %b | b2: %b | b3: %b | c1: %b | c2: %b | c3: %b | d1: %b | d2: %b | d3: %b | ss1: %b | ss2: %b | ss3: %b | ss4: %b | next_state: %0d | state: %0d | ID: %b",
             $time, a1, a2, a3, b1, b2, b3, c1, c2, c3, d1, d2, d3, ss1, ss2, ss3, ss4, next_state, state, ID);

       end
       // Set ss3 high and display after 5 more time units
    a1=1'b0; a2=1'b0; a3=1'b0;
    b1=1'b0; b2=1'b0; b3=1'b0;
    c1=1'b0; c2=1'b0; c3=1'b0;
    d1=1'b0; d2=1'b0; d3=1'b0;
    ss1=1'b0; ss2=1'b0; ss3=1'b0; ss4=1'b0;
    
        
    for(i=0; i<10; i= i+1)
       begin
        #1
        $display("Time: %0d | a1: %b | a2: %b | a3: %b | b1: %b | b2: %b | b3: %b | c1: %b | c2: %b | c3: %b | d1: %b | d2: %b | d3: %b | ss1: %b | ss2: %b | ss3: %b | ss4: %b | next_state: %0d | state: %0d | ID: %b",
             $time, a1, a2, a3, b1, b2, b3, c1, c2, c3, d1, d2, d3, ss1, ss2, ss3, ss4, next_state, state, ID);

       end

    #5
    $finish;
end

  
endmodule

