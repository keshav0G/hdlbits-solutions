//8bit even parity generator using reduction operator 
module top_module (
    input [7:0] in,
    output parity); 
    assign parity = ^ in[7:0];// parity = 0 if number of 1's is even
endmodule
