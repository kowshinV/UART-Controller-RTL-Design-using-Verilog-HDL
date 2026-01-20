module uart_tb;

    reg clk;
    reg rst;
    reg tx_start;
    reg [7:0] tx_data;

    wire tx;
    wire [7:0] rx_data;
    wire rx_done;

    // loopback
    wire rx = tx;

    uart DUT (
        .clk(clk),
        .rst(rst),
        .tx_start(tx_start),
        .tx_data(tx_data),
        .rx(rx),
        .tx(tx),
        .rx_data(rx_data),
        .rx_done(rx_done)
    );

    // 100 MHz clock
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        tx_start = 0;
        tx_data = 8'h00;

        #50;
        rst = 0;

        #100;
        tx_data = 8'hA5;
        tx_start = 1;

        #20;
        tx_start = 0;

        #5000;
        $finish;
    end
endmodule
