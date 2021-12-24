//Main module


module main_module (
			output wire [3:0] rowwrite,
			input [3:0] colread,
			input clk,
			output wire [3:0] grounds,
			output wire [6:0] display,
			input pushbutton //may be used as clock
			);

reg [15:0] data_all;
wire [3:0] keyout;
reg [25:0] clk1;
reg [1:0] ready_buffer;
reg ack;
reg statusordata;

//memory map is defined here
localparam	BEGINMEM=16'h0000,
		ENDMEM=16'h01ff,
		KEYPAD=16'h0900,
		SEVENSEG=16'h0b00;
//  memory chip
reg [15:0] memory [0:127]; 
 
// cpu's input-output pins
wire [15:0] data_out;
reg [15:0] data_in;
wire [15:0] address;
wire memwt;


sevensegment ss1 (//to be added);

keypad  kp1(//to be added);

bird br1 (//to be added);


//multiplexer for cpu input
always @*
	if ( (BEGINMEM<=address) && (address<=ENDMEM) )
		begin
			data_in=memory[address];
			ack=0;
			statusordata=0;
		end
	else if (address==KEYPAD+1)
		begin	
			statusordata=1;
			data_in=keyout;
			ack=0;
		end
	else if (address==KEYPAD)
		begin
			//to be added 
		end
	else
		begin
			data_in=16'hf345; //any number
			ack=0;
			statusordata=0;
		end

//multiplexer for cpu output 

always @(posedge clk) //data output port of the cpu
	if (memwt)
		if ( (BEGINMEM<=address) && (address<=ENDMEM) )
			memory[address]<=data_out;
		else if ( SEVENSEG==address) 
			data_all<=data_out;


initial 
	begin
		data_all=0;
		ack=0;
		statusordata=0;
		$readmemh("ram.dat", memory);
	end

endmodule