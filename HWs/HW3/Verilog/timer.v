
module timer(
                input pushbutton,
                input clk,
                input ack1,
                input statusordata1,
                output reg [15:0] timeout);

reg ready;
reg [25:0] clk1;
reg [15:0] current_time;
always @(posedge clk)
	clk1<=clk1+1;
    
always @(posedge clk)
    begin
        if ((ack1==1)&&(ready==1))
            begin
                ready<=0;
            end      
        else if ((pushbutton==0))
            ready<=1;
    end
// at every second update current_time
always @(posedge clk1[25]) begin
        current_time <= current_time + 1;
        // clk1 = 26'b0;
end

always @(*)
if (statusordata1==1)
    timeout={15'b0,ready};
else
    timeout=current_time;


initial begin		
    clk1 = 0;
    ready=0;
end
endmodule