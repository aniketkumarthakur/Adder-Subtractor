 `include "full__adder.v"
 module RCAS_TB;
   wire [15:0] S, Cout;
   reg [15:0] A, B;
 reg ctrl;


 ripple_carry_adder_subtractor rcas(A, B, ctrl, S, Cout);

 initial begin
   $dumpfile("dump.vcd");
   $dumpvars(1);
   $monitor("CTRL=%b: A = %d, B = %d --> S = %d, Cout[15] = %b", ctrl, A, B,
            S, Cout[15]);
   repeat(8)begin
     {A,B,ctrl}=$random;
     #5;
   end
 end
 endmodule