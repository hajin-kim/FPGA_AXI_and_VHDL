----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/24 05:57:38
-- Design Name: 
-- Module Name: mult_16 - mult_16_arch
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
    use ieee.std_logic_1164.all;
    
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mult_16 is
  port(
    clk: in std_logic;
    a: in std_logic_vector(15 downto 0);
    b: in std_logic_vector(15 downto 0);
    p: out std_logic_vector(31 downto 0)
  );
end mult_16;

architecture mult_16_arch of mult_16 is

begin
  process (clk)
  begin
    if ( rising_edge(clk) ) then
      p <= a * b;
    end if;
  end process;
  
end mult_16_arch;
