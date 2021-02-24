library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dogain_v1_0 is
	generic (
		-- Users to add parameters here
        NUM_DATA    : integer   := 1000;
        
		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface S00_AXI_CTRL_BUS
		C_S00_AXI_CTRL_BUS_DATA_WIDTH	: integer	:= 32;
		C_S00_AXI_CTRL_BUS_ADDR_WIDTH	: integer	:= 4;

		-- Parameters of Axi Slave Bus Interface InStream
		C_InStream_TDATA_WIDTH	: integer	:= 32;

		-- Parameters of Axi Master Bus Interface OutStream
		C_OutStream_TDATA_WIDTH	: integer	:= 32;
		C_OutStream_START_COUNT	: integer	:= 32
	);
	port (
		-- Users to add ports here
--        aclk    : in std_logic;
--        aresetn : in std_logic;
		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface S00_AXI_CTRL_BUS
		s00_axi_ctrl_bus_aclk	: in std_logic;
		s00_axi_ctrl_bus_aresetn	: in std_logic;
		s00_axi_ctrl_bus_awaddr	: in std_logic_vector(C_S00_AXI_CTRL_BUS_ADDR_WIDTH-1 downto 0);
		s00_axi_ctrl_bus_awprot	: in std_logic_vector(2 downto 0);
		s00_axi_ctrl_bus_awvalid	: in std_logic;
		s00_axi_ctrl_bus_awready	: out std_logic;
		s00_axi_ctrl_bus_wdata	: in std_logic_vector(C_S00_AXI_CTRL_BUS_DATA_WIDTH-1 downto 0);
		s00_axi_ctrl_bus_wstrb	: in std_logic_vector((C_S00_AXI_CTRL_BUS_DATA_WIDTH/8)-1 downto 0);
		s00_axi_ctrl_bus_wvalid	: in std_logic;
		s00_axi_ctrl_bus_wready	: out std_logic;
		s00_axi_ctrl_bus_bresp	: out std_logic_vector(1 downto 0);
		s00_axi_ctrl_bus_bvalid	: out std_logic;
		s00_axi_ctrl_bus_bready	: in std_logic;
		s00_axi_ctrl_bus_araddr	: in std_logic_vector(C_S00_AXI_CTRL_BUS_ADDR_WIDTH-1 downto 0);
		s00_axi_ctrl_bus_arprot	: in std_logic_vector(2 downto 0);
		s00_axi_ctrl_bus_arvalid	: in std_logic;
		s00_axi_ctrl_bus_arready	: out std_logic;
		s00_axi_ctrl_bus_rdata	: out std_logic_vector(C_S00_AXI_CTRL_BUS_DATA_WIDTH-1 downto 0);
		s00_axi_ctrl_bus_rresp	: out std_logic_vector(1 downto 0);
		s00_axi_ctrl_bus_rvalid	: out std_logic;
		s00_axi_ctrl_bus_rready	: in std_logic;

		-- Ports of Axi Slave Bus Interface InStream
		instream_aclk	: in std_logic;
		instream_aresetn	: in std_logic;
		instream_tready	: out std_logic;
		instream_tdata	: in std_logic_vector(C_InStream_TDATA_WIDTH-1 downto 0);
		instream_tstrb	: in std_logic_vector((C_InStream_TDATA_WIDTH/8)-1 downto 0);
		instream_tlast	: in std_logic;
		instream_tvalid	: in std_logic;

		-- Ports of Axi Master Bus Interface OutStream
		outstream_aclk	: in std_logic;
		outstream_aresetn	: in std_logic;
		outstream_tvalid	: out std_logic;
		outstream_tdata	: out std_logic_vector(C_OutStream_TDATA_WIDTH-1 downto 0);
		outstream_tstrb	: out std_logic_vector((C_OutStream_TDATA_WIDTH/8)-1 downto 0);
		outstream_tlast	: out std_logic;
		outstream_tready	: in std_logic
	);
end dogain_v1_0;

architecture arch_imp of dogain_v1_0 is

	-- component declaration
	component dogain_v1_0_S00_AXI_CTRL_BUS is
		generic (
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 4
		);
		port (
		gain	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		dogain_done	: in std_logic;
		S_AXI_ACLK	: in std_logic;
		S_AXI_ARESETN	: in std_logic;
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		S_AXI_AWVALID	: in std_logic;
		S_AXI_AWREADY	: out std_logic;
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WVALID	: in std_logic;
		S_AXI_WREADY	: out std_logic;
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		S_AXI_BVALID	: out std_logic;
		S_AXI_BREADY	: in std_logic;
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		S_AXI_ARVALID	: in std_logic;
		S_AXI_ARREADY	: out std_logic;
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		S_AXI_RVALID	: out std_logic;
		S_AXI_RREADY	: in std_logic
		);
	end component dogain_v1_0_S00_AXI_CTRL_BUS;

	component dogain_v1_0_InStream is
		generic (
        NUM_DATA    : integer   := 1000;
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
		);
		port (

        propagation_enable: in std_logic;
		
		instream_req: out std_logic;
		instream_captured_tdata: out std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
		instream_captured_tstrb: out std_logic_vector((C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
		instream_captured_tlast: out std_logic;
		instream_captured_tvalid: out std_logic;
		
		S_AXIS_ACLK	: in std_logic;
		S_AXIS_ARESETN	: in std_logic;
		S_AXIS_TREADY	: out std_logic;
		S_AXIS_TDATA	: in std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
		S_AXIS_TSTRB	: in std_logic_vector((C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
		S_AXIS_TLAST	: in std_logic;
		S_AXIS_TVALID	: in std_logic
		);
	end component dogain_v1_0_InStream;

	component dogain_v1_0_OutStream is
		generic (
        NUM_DATA    : integer   := 1000;
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (

        propagation_enable: out std_logic;
    
        in_req: in std_logic;
        in_tdata: in std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
        in_tstrb: in std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
        in_tlast: in std_logic;
        in_tvalid: in std_logic;
    
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component dogain_v1_0_OutStream;
	
	component dogain_mult is
      generic (
        DOGAIN_MULT_DATA_WIDTH	: integer	:= 32
      );
      port (
        -- Global Clock Signal
        ACLK	: in std_logic;
        -- Global Reset Signal. This Signal is Active LOW
        ARESETN	: in std_logic;
        
        propagation_enable: in std_logic;
        
        gain: in std_logic_vector(DOGAIN_MULT_DATA_WIDTH-1 downto 0) ;
        
        in_req: in std_logic;
        in_tdata: in std_logic_vector(DOGAIN_MULT_DATA_WIDTH-1 downto 0);
        in_tstrb: in std_logic_vector((DOGAIN_MULT_DATA_WIDTH/8)-1 downto 0);
        in_tlast: in std_logic;
        in_tvalid: in std_logic;
        
        mult_req: out std_logic;
        mult_tdata: out std_logic_vector(DOGAIN_MULT_DATA_WIDTH-1 downto 0);
        mult_tstrb: out std_logic_vector((DOGAIN_MULT_DATA_WIDTH/8)-1 downto 0);
        mult_tlast: out std_logic;
        mult_tvalid: out std_logic
      ) ;
    end component ;

-- Signals
    
	signal gain: std_logic_vector(C_S00_AXI_CTRL_BUS_DATA_WIDTH-1 downto 0);
	
	signal instream_req: std_logic;
	signal instream_captured_tdata: std_logic_vector(C_InStream_TDATA_WIDTH-1 downto 0);
	signal instream_captured_tstrb: std_logic_vector((C_InStream_TDATA_WIDTH/8)-1 downto 0);
	signal instream_captured_tlast: std_logic;
	signal instream_captured_tvalid: std_logic;
	
	signal mult_MOut: std_logic_vector(63 downto 0) ;
    
    signal fifo_req: std_logic;
    signal fifo_tdata: std_logic_vector(C_InStream_TDATA_WIDTH-1 downto 0);
    signal fifo_tstrb: std_logic_vector((C_InStream_TDATA_WIDTH/8)-1 downto 0);
    signal fifo_tlast: std_logic;
    signal fifo_tvalid: std_logic;
    
    signal sig_outstream_tlast: std_logic;
    signal sig_propagation_enable: std_logic;
    
begin

-- Instantiation of Axi Bus Interface S00_AXI_CTRL_BUS
dogain_v1_0_S00_AXI_CTRL_BUS_inst : dogain_v1_0_S00_AXI_CTRL_BUS
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_S00_AXI_CTRL_BUS_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_CTRL_BUS_ADDR_WIDTH
	)
	port map (
        gain    => gain,
        dogain_done    => sig_outstream_tlast,
		S_AXI_ACLK	=> s00_axi_ctrl_bus_aclk,
		S_AXI_ARESETN	=> s00_axi_ctrl_bus_aresetn,
		S_AXI_AWADDR	=> s00_axi_ctrl_bus_awaddr,
		S_AXI_AWPROT	=> s00_axi_ctrl_bus_awprot,
		S_AXI_AWVALID	=> s00_axi_ctrl_bus_awvalid,
		S_AXI_AWREADY	=> s00_axi_ctrl_bus_awready,
		S_AXI_WDATA	=> s00_axi_ctrl_bus_wdata,
		S_AXI_WSTRB	=> s00_axi_ctrl_bus_wstrb,
		S_AXI_WVALID	=> s00_axi_ctrl_bus_wvalid,
		S_AXI_WREADY	=> s00_axi_ctrl_bus_wready,
		S_AXI_BRESP	=> s00_axi_ctrl_bus_bresp,
		S_AXI_BVALID	=> s00_axi_ctrl_bus_bvalid,
		S_AXI_BREADY	=> s00_axi_ctrl_bus_bready,
		S_AXI_ARADDR	=> s00_axi_ctrl_bus_araddr,
		S_AXI_ARPROT	=> s00_axi_ctrl_bus_arprot,
		S_AXI_ARVALID	=> s00_axi_ctrl_bus_arvalid,
		S_AXI_ARREADY	=> s00_axi_ctrl_bus_arready,
		S_AXI_RDATA	=> s00_axi_ctrl_bus_rdata,
		S_AXI_RRESP	=> s00_axi_ctrl_bus_rresp,
		S_AXI_RVALID	=> s00_axi_ctrl_bus_rvalid,
		S_AXI_RREADY	=> s00_axi_ctrl_bus_rready
	);

-- Instantiation of Axi Bus Interface InStream
dogain_v1_0_InStream_inst : dogain_v1_0_InStream
	generic map (
        NUM_DATA    => NUM_DATA,
		C_S_AXIS_TDATA_WIDTH	=> C_InStream_TDATA_WIDTH
	)
	port map (

        propagation_enable  => sig_propagation_enable,
	
		instream_req  => instream_req,
        instream_captured_tdata	=> instream_captured_tdata,
        instream_captured_tstrb	=> instream_captured_tstrb,
        instream_captured_tlast	=> instream_captured_tlast,
        instream_captured_tvalid	=> instream_captured_tvalid,	
	
		S_AXIS_ACLK	=> instream_aclk,
		S_AXIS_ARESETN	=> instream_aresetn,
		S_AXIS_TREADY	=> instream_tready,
		S_AXIS_TDATA	=> instream_tdata,
		S_AXIS_TSTRB	=> instream_tstrb,
		S_AXIS_TLAST	=> instream_tlast,
		S_AXIS_TVALID	=> instream_tvalid
	);

-- Instantiation of Axi Bus Interface OutStream
dogain_v1_0_OutStream_inst : dogain_v1_0_OutStream
	generic map (
        NUM_DATA    => NUM_DATA,
		C_M_AXIS_TDATA_WIDTH	=> C_OutStream_TDATA_WIDTH,
		C_M_START_COUNT	=> C_OutStream_START_COUNT
	)
	port map (

        propagation_enable  => sig_propagation_enable,
        
	    in_req	=> fifo_req,
        in_tdata	=> fifo_tdata,
        in_tstrb	=> fifo_tstrb,
        in_tlast	=> fifo_tlast,
        in_tvalid	=> fifo_tvalid,
        
		M_AXIS_ACLK	=> outstream_aclk,
		M_AXIS_ARESETN	=> outstream_aresetn,
		M_AXIS_TVALID	=> outstream_tvalid,
		M_AXIS_TDATA	=> outstream_tdata,
		M_AXIS_TSTRB	=> outstream_tstrb,
		M_AXIS_TLAST	=> sig_outstream_tlast,
		M_AXIS_TREADY	=> outstream_tready
	);
	outstream_tlast <= sig_outstream_tlast;


dogain_mult_inst: dogain_mult
    generic map (
        DOGAIN_MULT_DATA_WIDTH  => C_OutStream_TDATA_WIDTH
    )
    port map (
		ACLK	=> outstream_aclk,
		ARESETN	=> outstream_aresetn,
        
        gain	=> gain,
        
        propagation_enable	=> sig_propagation_enable,
        
        in_req	=> instream_req,
        in_tdata	=> instream_captured_tdata,
        in_tstrb	=> instream_captured_tstrb,
        in_tlast	=> instream_captured_tlast,
        in_tvalid	=> instream_captured_tvalid,
        
        mult_req	=> fifo_req,
        mult_tdata	=> fifo_tdata,
        mult_tstrb	=> fifo_tstrb,
        mult_tlast	=> fifo_tlast,
        mult_tvalid	=> fifo_tvalid
      ) ;
    

end arch_imp;
