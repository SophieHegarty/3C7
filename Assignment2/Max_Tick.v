`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:37:37 04/03/2018 
// Design Name: 
// Module Name:    Max_Tick 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Max_Tick
	#(parameter	M = 10) //take in parameter of how long the light will be high for 
	
	(input wire clk, reset,
	output wire max_tick,
	output wire [5:0] q);
	
	reg [5:0] r_reg =1'b0;
	wire [5:0] r_next;
	
	//set up states
	always @(posedge clk, posedge reset)
		if(reset)
			r_reg <= 0;
		else
			r_reg <= r_next;
		
	//next-state logic
	assign r_next = (r_reg ==(M-1)) ? 0 : r_reg + 1; // r_next = 0 if reg = M-1 else plus 1
	//output logic
	assign q = r_reg;
	assign max_tick = (r_reg ==(M-1)) ? 1'b1 : 1'b0; //max_tick goes high once the reg = the parameter read in 
endmodule
