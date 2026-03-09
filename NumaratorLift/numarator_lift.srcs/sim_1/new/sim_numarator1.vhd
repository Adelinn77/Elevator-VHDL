----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/19/2024 11:36:29 PM
-- Design Name: 
-- Module Name: sim_numarator1 - Behavioral
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

entity sim_numarator1 is
--  Port ( );
end sim_numarator1;

architecture Behavioral of sim_numarator1 is
component counter_etaj is
    Port ( d_in : in STD_LOGIC_VECTOR (3 downto 0);
           en : in STD_LOGIC;
           sens : in STD_LOGIC_VECTOR (1 downto 0);
           clk : in STD_LOGIC;
           d_out : out STD_LOGIC_VECTOR (3 downto 0):= "1111");
end component;
signal d_in : STD_LOGIC_VECTOR (3 downto 0);
signal en : STD_LOGIC := '0';
signal sens : STD_LOGIC_VECTOR (1 downto 0):= "11";
signal clk : STD_LOGIC;
signal d_out : STD_LOGIC_VECTOR (3 downto 0):= "1111";
constant clk_period:time:=10ns;
begin
uut: counter_etaj PORT MAP(d_in, en, sens, clk, d_out);
gen_clock: process(clk)
begin
    if clk = 'U' then clk <= '0';
    else clk <= not clk after clk_period/2;
    end if;
end process;
stimuli: process
begin
    en <= '1';
    wait for clk_period*2;    
        sens <= "01";
        d_in <= "0110";
    wait for clk_period*2;
        sens <= "10";
        d_in <= "1010";
    wait for clk_period*2;
        sens <= "01";
        d_in <= "1011";
        en <= '0';
    wait for clk_period*3; 
        
end process;
end Behavioral;
