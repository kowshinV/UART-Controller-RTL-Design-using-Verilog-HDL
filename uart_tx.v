module uart_tx (
    input  wire clk,
    input  wire rst,
    input  wire baud_tick,
    input  wire tx_start,
    input  wire [7:0] tx_data,
    output reg  tx
);

    reg [3:0] bit_cnt;
    reg [9:0] shift_reg;
    reg busy;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            tx <= 1'b1;          // idle
            busy <= 0;
            bit_cnt <= 0;
        end else begin
            if (tx_start && !busy) begin
                // load frame: start(0), data, stop(1)
                shift_reg <= {1'b1, tx_data, 1'b0};
                busy <= 1;
                bit_cnt <= 0;
            end else if (busy && baud_tick) begin
                tx <= shift_reg[0];
                shift_reg <= shift_reg >> 1;
                bit_cnt <= bit_cnt + 1;

                if (bit_cnt == 9) begin
                    busy <= 0;
                    tx <= 1'b1;
                end
            end
        end
    end
endmodule
