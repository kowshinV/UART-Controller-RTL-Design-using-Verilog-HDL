module baud_rate_generator (
    input  wire clk,
    input  wire rst,
    output reg  baud_tick
);
    // fast divider for simulation
    parameter BAUD_DIV = 16;

    reg [4:0] cnt;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cnt <= 0;
            baud_tick <= 0;
        end else if (cnt == BAUD_DIV-1) begin
            cnt <= 0;
            baud_tick <= 1;
        end else begin
            cnt <= cnt + 1;
            baud_tick <= 0;
        end
    end
endmodule
