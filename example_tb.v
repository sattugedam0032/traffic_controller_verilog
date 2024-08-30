`include "example.v"
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
wire  ID;
wire  state;
wire  next_state;
wire  maxout;

// Instantiate the Unit Under Test (UUT)
example DUT (
    ID,clock,state, next_state,clear, maxout,a1,a2,a3,b1,b2,b3,c1,c2,c3,d1,d2,d3,ss1,ss2,ss3,ss4
);

initial begin

    $dumpfile("wave_form.vcd");
    $dumpvars(0,testbench);
    // Initialize Inputs
    clock = 0;
    clear = 1;
    a1 = 0; a2 = 0; a3 = 0;
    b1 = 0; b2 = 0; b3 = 0;
    c1 = 0; c2 = 0; c3 = 0;
    d1 = 0; d2 = 0; d3 = 0;
    ss1 = 0; ss2 = 0; ss3 = 0; ss4 = 0;

    // Wait for global reset
    #10 clear = 0;

    // Test simple case: only a1 is active
    #10 a1 = 1;
    #20 a1 = 0;

    // Test all sensors on one road are active
    #10 a1 = 1; a2 = 1; a3 = 1;
    #20 a1 = 0; a2 = 0; a3 = 0;

    // Test maxout logic with multiple roads
    #10 a1 = 1; b2 = 1; c3 = 1;
    #20 a1 = 0; b2 = 0; c3 = 0;

    // Test with all sensors active on different roads
    #10 a1 = 1; b1 = 1; c1 = 1; d1 = 1;
    #20 a1 = 0; b1 = 0; c1 = 0; d1 = 0;

    // Test simple SS signal
    #10 ss1 = 1;
    #20 ss1 = 0;

    // Test complex situation: multiple road sensors + SS signals
    #10 a1 = 1; a2 = 1; b1 = 1; ss3 = 1;
    #20 a1 = 0; a2 = 0; b1 = 0; ss3 = 0;

    // End simulation
    #100 $finish;
end

always #5 clock = ~clock;

endmodule
