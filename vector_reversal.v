// 100 bit vector reversal using for loop
module top_module( 
    input [99:0] in,
    output [99:0] out
);
 //integer i;
    always@(*) begin
        for(int i=0 ; i<100; i = i+1)begin
            out[i] = in[99-i];
        end
    end

endmodule