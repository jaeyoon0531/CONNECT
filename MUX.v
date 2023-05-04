`define PARAM   32  
module  MUX(
    input   wire    [PARAM-1:0] A_i     ;
    input   wire    [PARAM-1:0] B_i     ;
    input   wire                SEL_i   ;
    output  wire    [PARAM-1:0] Y_o     ;
);

assign  Y_o =  (SEL_i==1'b0)?    A_i    :   B_i ;

endmodule