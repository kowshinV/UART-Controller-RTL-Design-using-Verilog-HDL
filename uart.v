module uart (
    input  wire clk,
    input  wire rst,
    input  wire tx_start,
    input  wire [7:0] tx_data,
    input  wire rx,
    output wire tx,
    output wire [7:0] rx_data,
    output wire rx_done
);

    wire baud_tick;

    baud_rate_generator BRG (
        .clk(clk),
        .rst(rst),
        .baud_tick(baud_tick)
    );

    uart_tx TX (
        .clk(clk),
        .rst(rst),
        .baud_tick(baud_tick),
        .tx_start(tx_start),
        .tx_data(tx_data),
        .tx(tx)
    );

    uart_rx RX (
        .clk(clk),
        .rst(rst),
        .baud_tick(baud_tick),
        .rx(rx),
        .rx_data(rx_data),
        .rx_done(rx_done)
    );
endmodule
