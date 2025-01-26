----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2024 03:49:13 PM
-- Design Name: 
-- Module Name: dcd12_4 - Behavioral
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

entity dcd12_4 is
    Port ( ext : in STD_LOGIC_VECTOR (12 downto 0);
           d_out : out STD_LOGIC_VECTOR (3 downto 0));
end dcd12_4;

architecture Behavioral of dcd12_4 is

begin

process(ext)
begin
    case ext is
            when "0000000000001" => d_out <= "0000";
            when "0000000000010" => d_out <= "0001";
            when "0000000000100" => d_out <= "0010";
            when "0000000001000" => d_out <= "0011";
            when "0000000010000" => d_out <= "0100";
            when "0000000100000" => d_out <= "0101";
            when "0000001000000" => d_out <= "0110";
            when "0000010000000" => d_out <= "0111";
            when "0000100000000" => d_out <= "1000";
            when "0001000000000" => d_out <= "1001";
            when "0010000000000" => d_out <= "1010";
            when "0100000000000" => d_out <= "1011";
            when "1000000000000" => d_out <= "1100";
            when others => d_out <= "1111";
        end case;
end process;
end Behavioral;
