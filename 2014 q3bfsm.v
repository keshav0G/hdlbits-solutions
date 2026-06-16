module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);

parameter[2:0] a = 0, b =1, c=2 ,d =3, e = 4;

reg[2:0] state, next;

always@(*)begin
    case (state)
        a:next = x? b:a;
        b:next = x? e:b;
        c:next = x? b:c;
        d:next = x? c:b;
        e:next = x? e:d;
    endcase
end

always @(posedge clk) begin
    if(reset)begin
        state<= a;
    end
    else begin
        state <= next;
    end
end

assign z = (state == d|| state == e);

endmodule
