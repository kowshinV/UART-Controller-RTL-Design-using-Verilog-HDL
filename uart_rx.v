module uart_rx (
    input  wire clk,
    input  wire rst,
    input  wire baud_tick,
    input  wire rx,
    output reg  [7:0] rx_data,
    output reg  rx_done
);

    reg [3:0] bit_cnt;
    reg [7:0] shift_reg;
    reg busy;
    reg start_seen;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            bit_cnt <= 0;
            shift_reg <= 0;
            rx_data <= 0;
            rx_done <= 0;
            busy <= 0;
            start_seen <= 0;
        end else begin
            rx_done <= 0;

            // detect start bit
            if (!busy && rx == 0) begin
                busy <= 1;
                bit_cnt <= 0;
                start_seen <= 1;   // mark start bit
            end
            else if (busy && baud_tick) begin
                if (start_seen) begin
                    // skip start bit (do nothing)
                    start_seen <= 0;
                end else begin
                    // sample data bits only
                    shift_reg <= {rx, shift_reg[7:1]};
                    bit_cnt <= bit_cnt + 1;

                    if (bit_cnt == 7) begin
                        rx_data <= shift_reg;
                        rx_done <= 1;
                        busy <= 0;
                    end
                end
            end
        end
    end
endmodule
