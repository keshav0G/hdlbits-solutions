module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err
  );

	localparam [3:0] idle = 0,
					 s1  = 1,
					 s2  = 2,
					 s3= 3,
					 s4 = 4,
					 s5 = 5,
					 s6  = 6,
					 DISC = 7,
					 FLAG = 8,
					 ERR  = 9;

	reg [3:0] state, next;

	always @(*) begin
		case (state)
			idle : next = (in) ? s1  : idle;
			s1	 : next = (in) ? s2   : idle;
			s2 : next = (in) ? s3 : idle;
			s3: next = (in) ? s4  : idle;
			s4 : next = (in) ? s5  : idle;
			s5 : next = (in) ? s6   : DISC;
			s6	 : next = (in) ? ERR   : FLAG;
			DISC : next = (in) ? s1   : idle;
			FLAG : next = (in) ? s1  : idle;
			ERR  : next = (in) ? ERR   : idle;
		endcase
	end 

	always @(posedge clk) begin
		if (reset)begin
			state <= idle;
                    end

		else begin
			state <= next;
        end
	end

	assign disc = (state == DISC);
	assign flag = (state == FLAG);
	assign err = (state == ERR);
  
endmodule