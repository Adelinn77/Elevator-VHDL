----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/20/2024 07:00:56 PM
-- Design Name: 
-- Module Name: dcd_et - Behavioral
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

entity dcd_et is
    Port ( et_crt : in STD_LOGIC_VECTOR (3 downto 0);
           zec : out STD_LOGIC_VECTOR (3 downto 0):= "0000";
           uni : out STD_LOGIC_VECTOR (3 downto 0));
end dcd_et;

architecture Behavioral of dcd_et is

begin
process(et_crt)
begin
case et_crt is 
        when "0000" => zec <= "0000";
               uni <= "0000";
        when "0001" => zec <= "0000";
               uni <= "0001";
        when "0010" => zec <= "0000";
               uni <= "0010";
        when "0011" => zec <= "0000";
               uni <= "0011";                                                              
        when "0100" => zec <= "0000";
               uni <= "0100";
        when "0101" => zec <= "0000";
               uni <= "0101";
        when "0110" => zec <= "0000";
               uni <= "0110";
        when "0111" => zec <= "0000";
               uni <= "0111";
        when "1000" => zec <= "0000";
               uni <= "1000";               
        when "1001" => zec <= "0000";
               uni <= "1001";
        when "1010" => zec <= "0001";
               uni <= "0000";
        when "1011" => zec <= "0001";
               uni <= "0001";
        when "1100" => zec <= "0001";
               uni <= "0010"; 
        when others => zec <= "1111";
               uni <= "1111"; 
                                                                                                          
end case;

end process;
end Behavioral;
