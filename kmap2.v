//to impliment given k-map
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out = (~a&~b&~c)|(~a&~c&~d)|(a&~b&~c)|(a&c&d)|(~a&b&c)|(~a&c&~d);
endmodule