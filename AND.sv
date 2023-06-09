module  AND(
    input   wire    [31:0]  A_i ;
    input   wire            B_i ;
    output  wire    [31:0]  Y_o ;
);

    wire    w_31    ;
    wire    w_30    ;
    wire    w_29    ;
    wire    w_28    ;

    wire    w_27    ;
    wire    w_26    ;
    wire    w_25    ;
    wire    w_24    ;

    wire    w_23    ;
    wire    w_22    ;
    wire    w_21    ;
    wire    w_20    ;

    wire    w_19    ;
    wire    w_18    ;
    wire    w_17    ;
    wire    w_16    ;

    wire    w_15    ;
    wire    w_14    ;
    wire    w_13    ;
    wire    w_12    ;

    wire    w_11    ;
    wire    w_10    ;
    wire    w_09    ;
    wire    w_08    ;

    wire    w_07    ;
    wire    w_06    ;
    wire    w_05    ;
    wire    w_04    ;
    
    wire    w_03    ;
    wire    w_02    ;
    wire    w_01    ;
    wire    w_00    ;
    
    assign  w_31    =   A_i[31]&B_i ;
    assign  w_30    =   A_i[30]&B_i ;
    assign  w_29    =   A_i[29]&B_i ;
    assign  w_28    =   A_i[28]&B_i ;
    assign  w_27    =   A_i[27]&B_i ;
    assign  w_26    =   A_i[26]&B_i ;
    assign  w_25    =   A_i[25]&B_i ;
    assign  w_24    =   A_i[24]&B_i ;
    assign  w_23    =   A_i[23]&B_i ;
    assign  w_22    =   A_i[22]&B_i ;
    assign  w_21    =   A_i[21]&B_i ;
    assign  w_20    =   A_i[20]&B_i ;
    assign  w_19    =   A_i[19]&B_i ;
    assign  w_18    =   A_i[18]&B_i ;
    assign  w_17    =   A_i[17]&B_i ;
    assign  w_16    =   A_i[16]&B_i ;
    assign  w_15    =   A_i[15]&B_i ;
    assign  w_14    =   A_i[14]&B_i ;
    assign  w_13    =   A_i[13]&B_i ;
    assign  w_12    =   A_i[12]&B_i ;
    assign  w_11    =   A_i[11]&B_i ;
    assign  w_10    =   A_i[10]&B_i ;
    assign  w_09    =   A_i[09]&B_i ;
    assign  w_08    =   A_i[08]&B_i ;
    assign  w_07    =   A_i[07]&B_i ;
    assign  w_06    =   A_i[06]&B_i ;
    assign  w_05    =   A_i[05]&B_i ;
    assign  w_04    =   A_i[04]&B_i ;
    assign  w_03    =   A_i[03]&B_i ;
    assign  w_02    =   A_i[02]&B_i ;
    assign  w_01    =   A_i[01]&B_i ;
    assign  w_00    =   A_i[00]&B_i ;

    assign  Y_o =  {    
                        w_31,
                        w_30,
                        w_29,
                        w_28,
                        w_27,
                        w_26,
                        w_25,
                        w_24,
                        w_23,
                        w_22,
                        w_21,
                        w_20,
                        w_19,
                        w_18,
                        w_17,
                        w_16,
                        w_15,
                        w_14,
                        w_13,
                        w_12,
                        w_11,
                        w_10,
                        w_09,
                        w_08,
                        w_07,
                        w_06,
                        w_05,
                        w_04,
                        w_03,
                        w_02,
                        w_01,
                        w_00
                    };
endmodule
