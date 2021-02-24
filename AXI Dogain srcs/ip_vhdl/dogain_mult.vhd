library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;

entity dogain_mult is
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
end entity ; -- dogain_mult

architecture dogain_mult_arch of dogain_mult is

    signal MOut: std_logic_vector(DOGAIN_MULT_DATA_WIDTH*2-1 downto 0);

begin

    -- Multiply the data
    MOut <= in_tdata * gain;

    -- Send data to FIFO flow
    dogain_multiplication_stage : process( ACLK )
    begin
        if( rising_edge(ACLK) ) then
            if ( ARESETN = '0') then
                mult_req <= '0';
                mult_tdata <= std_logic_vector(to_unsigned(0,DOGAIN_MULT_DATA_WIDTH));
                mult_tstrb <= std_logic_vector(to_unsigned(0,DOGAIN_MULT_DATA_WIDTH/8));
                mult_tlast <= '0';
                mult_tvalid <= '0';
            elsif(propagation_enable = '1') then
                mult_req <= in_req;
                mult_tdata <= MOut((DOGAIN_MULT_DATA_WIDTH-1) downto 0);
                mult_tstrb <= in_tstrb;
                mult_tlast <= in_tlast;
                mult_tvalid <= in_tvalid;
            end if ;
        end if ;
    end process ; -- dogain_multiplication_stage

end architecture ; -- dogain_mult_arch
