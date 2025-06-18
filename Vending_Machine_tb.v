module Vending_Machine_tb;

reg clk,rst,coin_in,cancel,dispense;
wire item_out;
Vending_Machine DUT (
    .clk(clk),
    .rst(rst),
    .coin_in(coin_in),
    .cancel(cancel),
    .dispense(dispense),
    .item_out(item_out));

initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin
    rst = 1;coin_in = 0;cancel = 0;dispense = 0;
    #20;
    rst = 0;
    coin_in = 1; //adding 1 coin
    #20;
    coin_in = 0;
    dispense = 1; //trying to dispense with 1 coin in
    #20;
    coin_in = 1; //adding 2 coins while trying to dispense
    #40;
    dispense = 0; //turning of dispense then adding 2 more coins
    #40;
    coin_in = 0; //5 coins exactly are now added
    #20;
    dispense = 1; //dispensing
    #20;
    coin_in = 1;//adding one coin
    #20;
    cancel = 1; //cancelling with one coin in
    coin_in = 0;
    #20;
    cancel = 0;
    coin_in = 1; //adding 5 coins after cancellation
    #120;
    $stop;
end
endmodule
