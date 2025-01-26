----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/29/2024 08:30:26 PM
-- Design Name: 
-- Module Name: registru_sens - Behavioral
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

entity registru_sens is
    Port ( d_in : in STD_LOGIC_VECTOR (1 downto 0);
           load : in STD_LOGIC;
           rst : in STD_LOGIC;
           CLK : in STD_LOGIC;
           d_out : out STD_LOGIC_VECTOR (1 downto 0));
end registru_sens;

architecture Behavioral of registru_sens is
begin
reg: process(rst, CLK, load, d_in)
begin
--d_out <= "11";
if(rst = '0') then
    if rising_edge(CLK) then
        if load = '1' then
            d_out <= d_in;
        else d_out <= "11";
        end if;
    end if;
else d_out <= "11";
end if;
end process;


end Behavioral;
