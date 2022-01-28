
module timer(pshbtn, clk1);

    input wire pshbtn;
    input wire [25:0] clk1; // clk1 is the clock signal for 1 second

    // register holds 16 bit data current_time
    output reg [15:0] current_time;

    // at every second update current_time
    always @(posedge clk1[25]) begin
        current_time <= current_time + 1;
        clk1 = 26'b0;
    end


endmodule