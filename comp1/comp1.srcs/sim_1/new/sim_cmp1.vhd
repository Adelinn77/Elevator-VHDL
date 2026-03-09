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

entity sim_cmp1 is
--  Port ( );
end sim_cmp1;

architecture Behavioral of sim_cmp1 is
component cmp1 is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           en : in STD_LOGIC;
           rez : out STD_LOGIC_VECTOR (1 downto 0):= "00");
end component;
signal a : STD_LOGIC_VECTOR (3 downto 0):= "0000";
signal b : STD_LOGIC_VECTOR (3 downto 0):= "0000";
signal clk : STD_LOGIC;
signal en : STD_LOGIC := '0';
signal rez : STD_LOGIC_VECTOR (1 downto 0);
constant clk_period:time:=10ns;
begin
uut: cmp1 PORT MAP(a, b, clk, en, rez);
gen_clock: process(CLK)
begin
    if clk = 'U' then clk <= '0';
    else clk <= not clk after clk_period/2;
    end if;
end process;
stimuli: process
begin
wait for clk_period*2;
        en  <= '1';
        a <= "1010";
        b <= "0011";
    wait for clk_period*2;
        a <= "0010";
        b <= "0101";
    wait for clk_period*2;
        a <= "0111";
        b <= "0111";
    wait for clk_period*2;
        en  <= '0';
        a <= "0111";
        b <= "0111";    
    wait for clk_period*3;
end process; 
end Behavioral;
