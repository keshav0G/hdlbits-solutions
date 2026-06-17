//refernce  https://www.geeksforgeeks.org/theory-of-computation/design-a-mealy-machine-for-2s-complement/

module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    
    localparam a = 0, b = 1;
    reg state, next;

    always@(*)begin
        case(state)
        a:begin
            next = x? b:a;
            z = x;
        end 
        b: begin
            next = b;
            z = ~x;
        end
        endcase

    end

    always@(posedge clk or posedge areset)begin
        if(areset)begin
            state<= a;
        end
        else begin
            state<= next;
        end
    end
endmodule
