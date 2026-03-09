----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/20/2024 07:46:29 PM
-- Design Name: 
-- Module Name: sim_counter_7seg - Behavioral
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

entity sim_counter_7seg is
--  Port ( );
end sim_counter_7seg;

architecture Behavioral of sim_counter_7seg is
component counter_7seg is
    Port ( clk : in STD_LOGIC;
           d_out : out STD_LOGIC_VECTOR (16 downto 0));
end component;
signal clk : std_logic;
signal d_out : std_logic_vector (16 downto 0);
constant clk_period:time:=10ns;
begin
uut: counter_7seg port map(clk, d_out);
gen_clock: process(clk)
begin
    if clk = 'U' then clk <= '0';
    else clk <= not clk after clk_period/2;
    end if;
end process;
stimuli: process
begin
    wait for clk_period*8;
end process;
end Behavioral;
