`define PARAM   32
module CONNECT(
    //=========================================================
    //  from CNN Engine
    //=========================================================
    input   wire    [PARAM-1:0] AR_i    ;
    input   wire    [PARAM-1:0] AW_i    ;
    input   wire    [PARAM-1:0] W_i     ;

    //=========================================================
    //  from AIDC
    //=========================================================
    input   wire                ENABLE_i;
    input   wire    [PARAM-1:0] CAR_i   ;   //compressed AR 
    input   wire    [PARAM-1:0] CAW_i   ;   //compressed AW 
    input   wire    [PARAM-1:0] CW_i    ;   //compressed W 

    input   wire    [PARAM-1:0] CR_i    ;   //compressed R

    //=========================================================
    //  from XHB
    //=========================================================
    input   wire    [PARAM-1:0] R_i     ;
    input   wire    [PARAM-1:0] B_i     ;

    //=========================================================
    //  to AIDC
    //=========================================================
    output  wire    [PARAM-1:0] EAR_o   ;   //enabled AR
    output  wire    [PARAM-1:0] EAW_o   ;   //enabled Aw
    output  wire    [PARAM-1:0] EW_o    ;   //enabled W

    output  wire    [PARAM-1:0] ER_o    ;   //enabled R

    //=========================================================
    //  to XHB
    //=========================================================
    output  wire    [PARAM-1:0] MAR_o   ;   //muxed AR
    output  wire    [PARAM-1:0] MAW_o   ;   //muxed AW
    output  wire    [PARAM-1:0] MW_o    ;   //muxed W

    //=========================================================
    //  Final OUTPUT
    //=========================================================
    /*
    output  wire    [PARAM-1:0] AR_o    ;
    output  wire    [PARAM-1:0] AW_o    ;
    output  wire    [PARAM-1:0] W_o     ;
    */
    
    output  wire    [PARAM-1:0] R_o     ;
    output  wire    [PARAM-1:0] B_o     ;
);

    //=========================================================
    //  AR, AW, W ch
    //=========================================================

    AND         u_and0(             //AR & EN
        .A_i        (AR_i       ),
        .B_i        (ENABLE_i   ),
        .Y_o        (EAR_o      )
    );

    AND         u_and1(             //AW & EN
        .A_i        (AW_i       ),
        .B_i        (ENABLE_i   ),
        .Y_o        (EAW_o      )
    );

    AND         u_and2(             //W & EN
        .A_i        (W_i        ),
        .B_i        (ENABLE_i   ),
        .Y_o        (EW_o       )
    );
    
    MUX         u_mux0(             //AR or CAR
        .A_i        (AR_i       ),
        .B_i        (CAR_i      ),
        .SEL_i      (ENABLE_i   ),
        .Y_o        (MAR_o      )
    );

    MUX         u_mux1(             //AW or CAW
        .A_i        (AW_i       ),
        .B_i        (CAW_i      ),
        .SEL_i      (ENABLE_i   ),
        .Y_o        (MAW_o      )
    );

    MUX         u_mux2(             //W or CW
        .A_i        (W_i        ),
        .B_i        (CW_i       ),
        .SEL_i      (ENABLE_i   ),
        .Y_o        (MW_o       )
    );
    
    //=========================================================
    //  R ch
    //=========================================================

    AND         u_and3(             //R & EN
        .A_i        (R_i        ),
        .B_i        (ENABLE_i   ),
        .Y_o        (ER_o       )
    );

    MUX         u_mux3(             //W or CW
        .A_i        (R_i        ),
        .B_i        (CR_i       ),
        .SEL_i      (ENABLE_i   ),
        .Y_o        (MR_o       )
    );

    // assign  AR_o    =   MAR_o   ;
    // assign  AW_o    =   MAW_o   ;
    // assign  W_o     =   MW_o    ;
    assign  R_o     =   MR_o    ;
    assign  B_o     =   B_i     ;

endmodule
