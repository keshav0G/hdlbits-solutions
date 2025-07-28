//Build a 64-bit arithmetic shift register, with synchronous load.
// The shifter can shift both left and right, and by 1 or 8 bit
// positions, selected by amount.module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 
    
    always@(posedge clk)begin
        if(load)begin
            q = data;
        end else if(ena) begin
            case(amount)
                0:q <= {q[62:0],1'b0};
                1: q <={q[55:0],8'b0};
                2:q <={q[63],q[63:1]};
                 3: q <= {{8{q[63]}}, q[63:8]};
            endcase
        end
    end
                       
                       

endmodule
