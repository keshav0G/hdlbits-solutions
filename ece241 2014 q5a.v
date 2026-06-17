//refernce  https://www.geeksforgeeks.org/theory-of-computation/design-a-mealy-machine-for-2s-complement/



// the problem however expects a moore machine solution, output does not change in the same clock as input 

module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    
    parameter a=2'b00, b=2'b01, c=2'b10;
    reg [1:0] state, next;
    
    always @(posedge clk or posedge areset)
        begin
            if (areset)
            state <= a;
    		else
            state <= next;
    	end
    
    always @(*)
        begin
            case (state)
                a: next<= x? b:a;
                b:next<= x? c:b;
                c: next<= x? c:b;
                default:   next <= a;
            endcase
        end
    
    assign z = (state == b);
        
endmodule