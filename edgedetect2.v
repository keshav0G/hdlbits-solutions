//detect both edges
module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    
    reg [7:0] Q;
    always@(posedge clk)begin
        anyedge <= ( in & ~Q )| ( ~in & Q) ;
       Q <= in ;
    end 

    

endmodule



//module _edge(input clk,input [7:0] in, output [7:0] pedge);
//    reg Q;
  //  always@(posedge clk)begin
    //    pedge <= in & ~Q;
      // Q <= in ;
//    end 
//endmodule

