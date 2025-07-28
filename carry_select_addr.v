module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0]suml1,suml2,sumh;
    wire sel;
    add16 instance1(
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sumh),
        .cout(sel));
    
    add16 instance2(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b0),
        .sum(suml1));
    add16 instance3(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b1),
        .sum(suml2));
    
   always @(*)
  begin
      case (sel)
          1'b0 : sum = {suml1,sumh};
          1'b1 : sum = {suml2,sumh};
      endcase
  end
        
    

endmodule
