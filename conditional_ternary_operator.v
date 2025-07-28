//Given four unsigned numbers, 
//find the minimum. Unsigned numbers can be 
//compared with standard comparison operators (a < b). Use the conditional operator to make two-way min circuits, then compose a few of them to create a 4-way min circuit.
module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
    wire [7:0] w1,w2;
    always@(*)begin
        w1 = a<b ? a : b ;
        w2 = c<d ? c: d ;
        min = w1<w2 ? w1:w2 ;
    end

endmodule