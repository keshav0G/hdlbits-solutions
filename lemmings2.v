//problem based on lemmings game
module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    
    parameter LEFT = 0, RIGHT = 1, FALL_L =2, FALL_R=3;
    reg[2:0] state,next_state;
    
     //state logic
    always@(*)begin
        case(state)
            LEFT:if(~ground)begin
                next_state = FALL_L;
            end else if(bump_left) begin
                next_state <= RIGHT;
            end else begin
                next_state = LEFT;
            end
                RIGHT:if(~ground)begin
                next_state = FALL_R;
                end else if(bump_right) begin
                next_state <= LEFT;
            end else begin
                next_state = RIGHT;
            end 
            FALL_L: if(ground)begin
                next_state = LEFT;
            end else begin
                next_state = FALL_L;
            end 
                FALL_R:if(ground)begin
                next_state = RIGHT;
            end else begin
                next_state = FALL_R;
            end
        endcase
    end
    
            
            
    always@(posedge clk,posedge areset)begin
        if(areset)begin
            state <= LEFT;
        end else begin
            state <= next_state;
        end
    end
    
            assign aaah = (state == FALL_L | state == FALL_R );
            assign walk_left = (state == LEFT);
            assign walk_right = (state == RIGHT);
   
            

endmodule
