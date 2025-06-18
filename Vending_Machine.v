module Vending_Machine (
    input clk,rst,coin_in,cancel,dispense,
    output item_out
);

localparam  IDLE = 3'b000,
            READY = 3'b101,
            DISPENSE = 3'b110;

reg [2:0] cs,ns;

reg [2:0] current_coins,next_coins;

always @(posedge clk or rst or cancel) begin
    if (rst || cancel)
    begin
        cs <= IDLE;
        current_coins <= 3'b000;
    end
    else
    begin
        cs <= ns;
        current_coins <= next_coins;
    end
end
always@(*) begin
    case (cs)
    IDLE: begin
        ns = (next_coins == READY)? READY : IDLE;
        next_coins = coin_in? current_coins + 1 : current_coins;
    end
    READY:
    begin
        ns = dispense? DISPENSE : READY;
        next_coins = 3'b000;
    end
    DISPENSE: 
    begin
        ns = IDLE;
        next_coins = 3'b000;
    end
    endcase
end

assign item_out = (cs == DISPENSE);

endmodule


