----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2024 08:28:00 PM
-- Design Name: 
-- Module Name: sim_registru - Behavioral
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

entity sim_registru is
--  Port ( );
end sim_registru;

architecture Behavioral of sim_registru is
component registru is
    Port ( d_in : in STD_LOGIC_VECTOR (3 downto 0);
           load : in STD_LOGIC;
           rst : in STD_LOGIC;
           CLK : in STD_LOGIC;
           d_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal d_in : STD_LOGIC_VECTOR (3 downto 0);
signal load : STD_LOGIC;
signal rst : STD_LOGIC;
signal CLK : STD_LOGIC;
signal d_out : STD_LOGIC_VECTOR (3 downto 0);
constant clk_period:time:=10ns;
begin
uut: registru PORT MAP(d_in, load, rst, CLK, d_out);
gen_clock: process(CLK)
begin
    if clk = 'U' then clk <= '0';
    else clk <= not clk after clk_period/2;
    end if;
end process;
stimuli: process
begin
    wait for clk_period*2;
        rst <= '0';
        load <= '1';
        d_in <= "1010";
    wait for clk_period*2;
        rst <= '0';
        load <= '1';
        d_in <= "0111";
    wait for clk_period*2;
        rst <= '0';
        d_in <= "0000";
        load <= '1';
    wait for clk_period*3;  
end process;
end Behavioral;
