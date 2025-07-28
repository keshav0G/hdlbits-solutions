//decade counter
module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
    
    always@(posedge clk)begin
        if (reset)begin
            q = 0;
        end else begin
            if(q == 4'd9)begin
                q = 0;
            end else begin
                q = q + 1;
            end 
        end
    end

endmodule