----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/19/2024 11:22:07 PM
-- Design Name: 
-- Module Name: counter - Behavioral
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

entity counter_etaj is
    Port ( d_in : in STD_LOGIC_VECTOR (3 downto 0);
           en : in STD_LOGIC;
           sens : in STD_LOGIC_VECTOR (1 downto 0);
           clk : in STD_LOGIC;
           d_out : out STD_LOGIC_VECTOR (3 downto 0));
end counter_etaj;

architecture Behavioral of counter_etaj is

begin

count: process(en, clk, d_in, sens)
begin
    d_out <= d_in;
    if en = '1' and rising_edge(clk) then   
        if sens = "01" then
            d_out <= d_in + "1";
        elsif sens = "10" then
            d_out <= d_in - "1";
        else
            d_out <= d_in;    
        end if;
     
    end if;  
end process;
end Behavioral;