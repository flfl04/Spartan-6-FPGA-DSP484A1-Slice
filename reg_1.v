module reg_1(ce,rst,clk,in,out);
	parameter reg_size =18 ;
	parameter rst_type =0;//SYNCH
	input ce,rst,clk ;
	input [reg_size-1:0] in ;
	output reg [reg_size-1:0] out ;
	if(rst_type) begin //ASYNCH RST
		always @(posedge clk or posedge rst ) begin
			if(rst) 
				out <= {reg_size{1'b0}};
			else begin 
				if(ce) out<=in ;
			end	
		end
	end
	else begin //SYNCH RST
		always @(posedge clk) begin
			if(rst) 
				out <= {reg_size{1'b0}};
			else begin 
				if(ce) out<=in ;
			end	
		end
	end	
endmodule

