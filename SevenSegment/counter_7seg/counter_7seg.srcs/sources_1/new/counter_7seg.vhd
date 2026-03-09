----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/20/2024 07:39:24 PM
-- Design Name: 
-- Module Name: counter_7seg - Behavioral
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

entity counter_7seg is
    Port ( clk : in STD_LOGIC;
           d_out : out STD_LOGIC_VECTOR (16 downto 0));
end counter_7seg;

architecture Behavioral of counter_7seg is
signal count: std_logic_vector(16 downto 0):= "00000000000000000";
begin
process(clk, count)
begin
if rising_edge(clk) then 
    count <= count+1;
end if;
d_out <= count;
end process;

end Behavioral;
