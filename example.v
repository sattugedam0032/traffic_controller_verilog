`define s0 5'd0
`define s1 5'd1
`define s2 5'd2
`define s3 5'd3
`define s4 5'd4
`define s5 5'd5
`define s6 5'd6
`define s7 5'd7
`define s8 5'd8
`define s9 5'd9
`define s10 5'd10
`define s11 5'd11
`define s12 5'd12
`define s13 5'd13
`define s14 5'd14
`define s15 5'd15
`define s16 5'd16
`define s17 5'd17
`define s18 5'd18
`define s19 5'd19
`define s20 5'd20
`define s21 5'd21
`define s22 5'd22
`define s23 5'd23
`define s24 5'd24
`define s25 5'd25
`define s26 5'd26



module example (ID, clock, state, next_state,clear, maxout,a1,a2,a3,b1,b2,b3,c1,c2,c3,d1,d2,d3,ss1,ss2,ss3,ss4);
    output reg [11:0]ID;
    output reg [5:0]state;
    output reg [5:0]next_state;
    output reg [2:0]maxout;

    // input clear,clock,a1,a2,a3,b1,b2,b3,c1,c2,c3,d1,d2,d3,ss1,ss2,ss3,ss4;
    // wire[2:0] max_out;
    // find_max fm_inst(a1,a2,a3,b1,b2,b3,c1,c2,c3,d1,d2,d3,max_out);

   initial begin
    state = s0;
    next_state = s0;
    ID = 12'b100100100100;
   end

   always @(posedge clock or posedge clear) begin
    if (clear)
        state <= `s0; // Reset the state to `s0 when clear is high
    else
        state <= next_state; // Update state to next_state
   end
   

   always @(state) begin
     case (state)
       `s0 : begin
              ID = 12'b100100100100;
             end
       `s1 : begin
               ID = 12'b100100100100;
             end 
       `s2 : begin
               ID = 12'b100100100100;
             end            
       `s3 : begin
               ID = 12'b100100100100;
             end 
       `s4 : begin
               ID = 12'b100100100100;
             end     
       `s5 : begin
               ID = 12'b100100100100;
             end
       `s6 : begin
               ID = 12'b001100100100;
             end
       `s7 : begin
               ID = 12'b001100100100;
             end
       `s8 : begin
               ID = 12'b001100100100;
             end 
       `s9 : begin
               ID = 12'b010100100100;
             end
       `s10 : begin
               ID = 12'b100001100100;
             end
       `s11 : begin
               ID = 12'b100001100100;
             end
       `s12 : begin
               ID = 12'b100001100100;
             end
       `s13 : begin
               ID = 12'b100010100100;
             end
       `s14 : begin
               ID = 12'b100100001100;
             end
       `s15 : begin
               ID = 12'b100100001100;
             end
       `s16 : begin
               ID = 12'b100100001100;
             end
       `s17 : begin
               ID = 12'b100100010100;
             end
       `s18 : begin
               ID = 12'b100100100001;
             end
       `s19 : begin
               ID = 12'b100100100001;
             end
       `s20 : begin
               ID = 12'b100100100001;
             end
       `s21 : begin
               ID = 12'b100100100010;
             end
       `s22 : begin
               ID = 12'b100100100100;
             end
       `s23 : begin
               ID = 12'b001100100100;
             end
       `s24 : begin
               ID = 12'b100001100100;
             end
       `s25 : begin
               ID = 12'b100100001100;
             end
       `s26 : begin
               ID = 12'b100100100001;
             end     
        default: ID = 12'b100100100100;
     endcase
   end
   
  always @(state or clear or a1 or a2 or a3 or b1 or b2 or b3 or c1 or c2 or c3 or d1 or d2 or d3 or ss1 or ss2 or ss3 or ss4)
   begin
    if(clear)
     next_state = `s0;

    else
    begin
      case (state)
       `s0 :begin
                if(ss1 || ss2 || ss3 || ss4)
                  next_state = `s22;

                if (a1 || b1 || c1 || d1) 
                  next_state = `s1;
         
                else
                  next_state = `s0;
            end

       `s1 : begin
                
                find_max(a1,a2,a3,b1,b2,b3,c1,c2,c3,d1,d2,d3,maxout);
               
                case (maxout)
                   1: next_state = `s2;
                   2: next_state = `s3;
                   3: next_state = `s4;
                   4: next_state = `s5; 
         
                  default: next_state = `s1;  
                endcase
              end

       `s2: begin
                if(a1 && a2 && a3)
                  next_state = `s8;

                else if(a1 && a2 && ~a3)
                  next_state = `s7;

                 else
                  next_state = `s6;
            end

       `s3: begin
                if(b1 && b2 && b3)
                  next_state = `s12;

                else if(b1 && b2 && ~b3)
                  next_state = `s11;

                else
                  next_state = `s10;
            end

       `s4: begin
                if(c1 && c2 && c3)
                  next_state = `s16;

                else if(c1 && c2 && ~c3)
                  next_state = `s15;

                else
                  next_state = `s14;
            end

       `s5: begin
                if(d1 && d2 && d3)
                  next_state = `s20;

                else if(d1 && d2 && ~d3)
                  next_state = `s19;

                else
                  next_state = `s18;
            end

       `s6: begin
                 if(ss2||ss3||ss4||~a1||b2||c2||d2)
                  next_state = `s9;

                 else
                  next_state = `s6;
            end

       `s7: begin
                if((~a1 && ~a2)||b3||c3||d3||ss2||ss3||ss4)
                  next_state = `s9;

                if(a1 && a2)
                  next_state = `s7;

                if(~a2 && a1)
                  next_state = `s6;
            end

       `s8: begin
                  if((~a1 && ~a2 && ~a3)||ss2||ss3||ss4)
                    next_state = `s9;

                  if(a1 && a2 && a3)
                    next_state = `s8;

                  if(~a3 && a2 && a1)
                    next_state = `s7;

                  if(~a3 && ~a2 && a1)
                    next_state = `s6;
            end

       `s9: begin
                 next_state = `s0;
       end

       `s10: begin
                 if(ss1||ss3||ss4||~b1||a2||c2||d2)
                    next_state = `s13;

                 else
                    next_state = `s10;
             end

       `s11: begin
                 if((~b1 && ~b2)||a3||c3||d3||ss1||ss3||ss4)
                    next_state = `s13;

                 if(b1 && b2)
                    next_state = `s11;

                 if(~b2 && b1)
                    next_state = `s10;
              end

       `s12: begin
                 if((~b1 && ~b2 && ~b3)||ss1||ss3||ss4)
                    next_state = `s13;

                 if(b1 && b2 && b3)
                    next_state = `s12;

                 if(~b3 && b2 && b1)
                    next_state = `s11;

                 if(~b3 && ~b2 && b1)
                    next_state = `s10;
             end

       `s13: begin
                 next_state = `s0;
       end

       `s14: begin
                if(ss2||ss1||ss4||~c1||b2||a2||d2)
                   next_state = `s17;

                else
                   next_state = `s14;
       end

       `s15: begin
                if((~c1 && ~c2)||b3||a3||d3||ss2||ss1||ss4)
                   next_state = `s17;

                if(c1 && c2)
                   next_state = `s15;

                if(~c2 && c1)
                   next_state = `s14;
             end

       `s16: begin
                if((~c1 && ~c2 && ~c3)||ss2||ss1||ss4)
                  next_state = `s17;

                if(c1 && c2 && c3)
                  next_state = `s16;

                if(~c3 && c2 && c1)
                  next_state = `s15;

                if(~c3 && ~c2 && c1)
                  next_state = `s14;
            end

       `s17: begin
                next_state = `s0;
             end

       `s18: begin
                if(ss2||ss3||ss1||~d1||b2||c2||a2)
                 next_state = `s21;

               else
                 next_state = `s18;
             end

       `s19: begin
               if((~d1 && ~d2)||b3||c3||a3||ss2||ss3||ss1)
                next_state = `s21;

               if(d1 && d2)
                 next_state = `s19;

              if(~d2 && d1)
                  next_state = `s18;
             end

       `s20: begin
               if((~d1 && ~d2 && ~d3)||ss2||ss3||ss1)
                    next_state = `s21;

               if(d1 && d2 && d3)
                 next_state = `s20;

               if(~d3 && d2 && d1)
                 next_state = `s19;

               if(~d3 && ~d2 && d1)
                  next_state = `s18;
             end

       `s21: begin
               next_state = `s0;
             end

       `s22: begin
              if(ss1)
                next_state = `s23;
              else if(ss2)
                next_state = `s24;
              else if(ss3)
                next_state = `s25;
              else if(ss4)
                next_state = `s26;
             end

       `s23: begin
              if(ss1)
                next_state = `s23;
              else
                next_state = `s9;
             end

       `s24: begin
              if(ss2)
               next_state = `s24;
              else
               next_state = `s13;
             end

       `s25: begin
              if(ss3)
                next_state = `s25;
              else
                next_state = `s17;
             end

       `s26: begin
               if(ss4)
                 next_state = `s26;
               else
                 next_state = `s21;
             end
        default: next_state = `s0;
      endcase
     end
   end


  //  task find_max;
  //  input a1,a2,a3,b1,b2,b3,c1,c2,c3,d1,d2,d3;
  //  output [2:0] max;
  //  reg [2:0] a,b,c,d;
  //  a = {a1,a2,a3};
  //  b = {b1,b2,b3};
  //  c = {c1,c2,c3};
  //  d = {d1,d2,d3};
  // begin
    
  
  //  if(a>=b)
  //  begin
  //   if(a>=c)
  //   begin
  //     if(a>=d)
  //     max = 1;

  //     else
  //     max = 4;
  //   end
  //   else
  //   begin
  //     if(c>=d)
  //     max = 3;

  //     else
  //     max =4;
  //   end
  //  end 

  //  else
  //  begin
  //   if(b>=c)
  //   begin
  //     if(b>=d)
  //     max =2;

  //     else
  //     max =4;
  //   end
  //   else
  //   begin
  //     if(c>=d)
  //     max = 3;
  //     else
  //     max = 4;
  //   end
  //  end
  //  end
  //  endtask
  task find_max;
   input a1, a2, a3, b1, b2, b3, c1, c2, c3, d1, d2, d3;
   output reg [2:0] max; // Declare max as a reg since it's assigned inside the task

   reg [2:0] a, b, c, d; // Declare a, b, c, d inside the task

   begin
      a = {a1, a2, a3};
      b = {b1, b2, b3};
      c = {c1, c2, c3};
      d = {d1, d2, d3};

      if (a >= b) begin
         if (a >= c) begin
            if (a >= d)
               max = 1; // 1 in binary
            else
               max = 4; // 4 in binary
         end else begin
            if (c >= d)
               max = 3; // 3 in binary
            else
               max = 4; // 4 in binary
         end
      end else begin
         if (b >= c) begin
            if (b >= d)
               max = 2; // 2 in binary
            else
               max = 4; // 4 in binary
         end else begin
            if (c >= d)
               max = 3; // 3 in binary
            else
               max = 4; // 4 in binary
         end
      end
   end
endtask



endmodule


