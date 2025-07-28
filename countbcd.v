module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    bcd_count obj1(clk,reset,1,q[3:0]);
    bcd_count obj2(clk,reset,ena[1],q[7:4]);
    bcd_count obj3(clk,reset,ena[3],q[11:8]);
    bcd_count obj4(clk,reset,ena[3],q[15:12]);
    
    assign ena[1] = (q[3:0] == 4'd9);
    assign ena[2] = (q[3:0] == 4'd9)&&(q[7:4] == 4'd9);
    assign ena[3] = (q[3:0] == 4'd9)&&(q[7:4] == 4'd9)&&(q[11:8] == 4'd9);
    //assign ena[1] = (q[3:0] == 4'd9)&&(q[7:4] == 4'd9)&&(q[11:8] == 4'd9)&&(q[15:12] == 4'd9);
    
        
    
    

endmodule
        
        module bcd_count(
            input clk,
            input reset,
            input ena,
            output [3:0] q);
            
            always@(posedge clk)begin
                if(reset || q==9)begin
                    q <= 0;
                end else if(ena) begin
                q <= q+1;
                end
            end
                    
        endmodule
// still not accepted
        