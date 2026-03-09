----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2024 09:45:37 PM
-- Design Name: 
-- Module Name: comparator - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cmp1 is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           en : in STD_LOGIC;
           rez : out STD_LOGIC_VECTOR (1 downto 0):= "00");
end cmp1;

architecture Behavioral of cmp1 is

begin
--rez <= "00";
cmp: process(clk, a, b)
begin
if en = '1' then
    if rising_edge(clk) then
        if(a > b) then 
            rez <= "10";
        elsif (a = b) then 
            rez <= "11";
        elsif(a < b) then 
            rez <= "01";
        end if;
    end if;
    else rez <= "00";
end if;

end process;
end Behavioral;

