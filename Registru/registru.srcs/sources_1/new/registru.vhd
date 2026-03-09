----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2024 08:14:51 PM
-- Design Name: 
-- Module Name: registru - Behavioral
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

entity registru is
    Port ( d_in : in STD_LOGIC_VECTOR (3 downto 0);
           load : in STD_LOGIC;
           rst : in STD_LOGIC;
           CLK : in STD_LOGIC;
           d_out : out STD_LOGIC_VECTOR (3 downto 0));
end registru;

architecture Behavioral of registru is

begin
reg: process(rst, CLK, load, d_in)
begin

    if rising_edge(CLK) then
        if load = '1' then
            d_out <= d_in;
        end if;
    end if;
end process;

end Behavioral;
