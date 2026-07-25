module moore_1010(
    input clk,
    input rst,
    input in,
    output reg detected
);

parameter A=3'b000,
          B=3'b001,
          C=3'b010,
          D=3'b011,
          E=3'b100;

reg [2:0] state, next_state;

// State register
always @(posedge clk or posedge rst)
begin
    if(rst)
        state <= A;
    else
        state <= next_state;
end

// Next-state logic
always @(*)
begin
    next_state = state;
    detected = 1'b0;

    case(state)

    A:
    begin
        if(in)
            next_state = B;
        else
            next_state = A;
    end

    B:
    begin
        if(in)
            next_state = B;
        else
            next_state = C;
    end

    C:
    begin
        if(in)
            next_state = D;
        else
            next_state = A;
    end

    D:
    begin
        if(in)
            next_state = B;
        else
            next_state = E;
    end

    E:
    begin
        detected = 1'b1;
        if(in)
            next_state = B;
        else
            next_state = C;
    end

    default:
    begin
        next_state = A;
        detected = 1'b0;
    end

    endcase
end

endmodule
