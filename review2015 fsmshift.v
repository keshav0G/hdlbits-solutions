module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    
    reg[1:0] counter;
    
    always@(posedge clk)begin
        //shift_ena <= 0;
        if(reset)begin
            shift_ena <= 1;
            counter <= 0;
        end else begin
            counter <= counter + 1;
            if(counter == 3)begin
                shift_ena <= 0 ;
            end
        end
    end

endmodule
