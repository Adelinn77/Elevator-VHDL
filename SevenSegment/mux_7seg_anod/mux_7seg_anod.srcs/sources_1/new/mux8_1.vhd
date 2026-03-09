----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/20/2024 12:34:28 PM
-- Design Name: 
-- Module Name: mux8_1 - Behavioral
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

entity mux8_1 is
    Port ( sel : in STD_LOGIC_VECTOR (2 downto 0);
           d_out : out STD_LOGIC_VECTOR (7 downto 0));
end mux8_1;

architecture Behavioral of mux8_1 is

begin
with sel select
       d_out <= "01111111" when "000",
                "10111111" when "001",
                "11111111" when "010",
                "11111111" when "011",
                "11111111" when "100",
                "11111111" when "101",
                "11111101" when "110",
                "11111110" when "111",
                (others => '0') when others; -- Default case
end Behavioral;
