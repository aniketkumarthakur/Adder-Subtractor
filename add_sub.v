module full_adder(
 input a, b, cin,
 output sum, cout
);

 assign {sum, cout} = {a^b^cin, ((a & b) | (b & cin) | (a & cin))};
endmodule
module ripple_carry_adder_subtractor #(parameter SIZE = 16) (
 input [SIZE-1:0] A, B,
 input CTRL,
 output [SIZE-1:0] S, Cout);
 wire [SIZE-1:0] Bc;
 genvar g;

 assign Bc[0] = B[0] ^ CTRL;

 full_adder fa0(A[0], Bc[0], CTRL, S[0], Cout[0]);
 generate 
 for(g = 1; g<SIZE; g=g+1) begin
 assign Bc[g] = B[g] ^ CTRL;
 full_adder fa(A[g], Bc[g], Cout[g-1], S[g], Cout[g]);
 end
 endgenerate
endmodule

