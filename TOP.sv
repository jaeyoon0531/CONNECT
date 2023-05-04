`include "TIME_SCALE.svh"
`include "PARAMS.svh"
`define PARAM   32

module TOP;

    logic                       clk;
    logic                       rst_n;

    // clock generation
    initial begin
        clk                         = 1'b0;
        forever
            #(`CLK_PERIOD/2) clk         = ~clk;
    end

    // reset generation
    initial begin
        
        rst_n                       = 1'b0;
        repeat (3) @(posedge clk);
        
        rst_n                       = 1'b1;
    end
    
    //APB_IF                          apb_if      (.clk(clk), .rst_n(rst_n));

    // AXI interface    
    AXI_A_IF                        axi_ar_if   (.clk(clk), .rst_n(rst_n));
    AXI_R_IF                        axi_r_if    (.clk(clk), .rst_n(rst_n));
    AXI_A_IF                        axi_aw_if   (.clk(clk), .rst_n(rst_n));
    AXI_W_IF                        axi_w_if    (.clk(clk), .rst_n(rst_n));
    AXI_B_IF                        axi_b_if    (.clk(clk), .rst_n(rst_n));

    axi_id_t                        simple_id;
    axi_id_t                        rid;
    axi_resp_t                      rresp;
 
    
    //=========================================================
    //  from CNN Engine
    //=========================================================
    wire    [PARAM-1:0] AR_i    ;
    wire    [PARAM-1:0] AW_i    ;
    wire    [PARAM-1:0] W_i     ;

    //=========================================================
    //  from AIDC
    //=========================================================
    wire                ENABLE_i;
    wire    [PARAM-1:0] CAR_i   ;   //compressed AR 
    wire    [PARAM-1:0] CAW_i   ;   //compressed AW 
    wire    [PARAM-1:0] CW_i    ;   //compressed W 

    wire    [PARAM-1:0] CR_i    ;   //compressed R

    //=========================================================
    //  from XHB
    //=========================================================
    wire    [PARAM-1:0] R_i     ;
    wire    [PARAM-1:0] B_i     ;

    //=========================================================
    //  to AIDC
    //=========================================================
    wire    [PARAM-1:0] EAR_o   ;   //enabled AR
    wire    [PARAM-1:0] EAW_o   ;   //enabled Aw
    wire    [PARAM-1:0] EW_o    ;   //enabled W

    wire    [PARAM-1:0] ER_o    ;   //enabled R

    //=========================================================
    //  to XHB
    //=========================================================
    wire    [PARAM-1:0] MAR_o   ;   //muxed AR
    wire    [PARAM-1:0] MAW_o   ;   //muxed AW
    wire    [PARAM-1:0] MW_o    ;   //muxed W
  
    //=========================================================
    //  Final OUTPUT
    //=========================================================
    /*
    wire    [PARAM-1:0] AR_o    ;
    wire    [PARAM-1:0] AW_o    ;
    wire    [PARAM-1:0] W_o     ;
    */
    wire    [PARAM-1:0] R_o     ;
    wire    [PARAM-1:0] B_o     ;
    

    wire    [PARAM-1:0] mc_b_intf;
    wire    [PARAM-1:0] icnt_b_intf;




    AIDC_TOP                        u_aidc
    (
        .clk                        (clk),
        .rst_n                      (rst_n),

        // APB interface
        .ENABLE_i                   (ENABLE_i),

        // AXI interface
        .icnt_aw_intf               (EAW_o),
        .icnt_w_intf                (EW_o),
        .icnt_b_intf                (icnt_b_intf)
        .icnt_ar_intf               (EAR_o),
        .icnt_r_intf                (CR_i),

        .mc_aw_intf                 (CAW_i),
        .mc_w_intf                  (CW_i),
        .mc_b_intf                  (mc_b_intf),
        .mc_ar_intf                 (CAR_i),
        .mc_r_intf                  (ER_o)
    );

    CNN_ENHINE                      u_cnn_engine
    (
        .clk                        (clk),
        .rst_n                      (rst_n),

        // AXI interface
        .axi_ar_if                  (AR_i),
        .axi_aw_if                  (AW_i),
        .axi_w_if                   (W_i),
        .axi_b_if                   (B_o),
        .axi_r_if                   (R_o)    
    );

    XHB                             u_xhb
    (
        .CLK                        (clk),
        .nSYSRESET                  (rst_n),
        
        .AWADDR                     (MAW_o),
        .ARADDR                     (MAR_o),
        .WDATA                      (MW_o),

        .RDATA                      (R_i),
        .BRESP                      (B_i)

    );


    CONNECT                         u_connect
    (
        .AR_i                       (AR_i),
        .AW_i                       (AW_i),
        .W_i                        (W_i),
        
        .ENABLE_i                   (ENABLE_i),
        .CAR_i                      (CAR_i),
        .CAW_i                      (CAW_i),
        .CW_i                       (CW_i),
        .CR_i                       (CR_i),

        .R_i                        (R_i),
        .B_i                        (B_i),
        
        .EAR_o                      (EAR_o),
        .EAW_o                      (EAW_o),
        .EW_o                       (EW_o),
        .ER_o                       (ER_o),

        .MAR_o                      (MAR_o),
        .MAW_o                      (MAW_o),
        .MW_o                       (MW_o),

        .AR_o                       (AR_o),
        .AW_o                       (AW_o),
        .W_o                        (W_o),
        
        .R_o                        (R_o),
        .B_o                        (B_o)
    );



endmodule
