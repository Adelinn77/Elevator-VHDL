----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/20/2024 07:19:29 PM
-- Design Name: 
-- Module Name: dcd_usi - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dcd_usi is
    Port ( s_usi : in STD_LOGIC;
           left : out STD_LOGIC_VECTOR (3 downto 0);
           right : out STD_LOGIC_VECTOR (3 downto 0));
end dcd_usi;

architecture Behavioral of dcd_usi is

begin
process(s_usi)
begin
if s_usi = '0' then 
    left <= "0001";
    right <= "1101";
elsif(s_usi = '1') then     
    left <= "1101";
    right <= "0001";
end if;    
end process;
end Behavioral;
