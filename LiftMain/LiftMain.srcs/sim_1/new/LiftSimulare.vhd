----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/29/2024 09:45:31 PM
-- Design Name: 
-- Module Name: LiftSimulare - Behavioral
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

entity LiftSimulare is
--  Port ( );
end LiftSimulare;

architecture Behavioral of LiftSimulare is


component LiftMain is
    Port ( clk: in std_logic;
           et_int4 : in STD_LOGIC_VECTOR (3 downto 0);
           et_ext12 : in STD_LOGIC_VECTOR (12 downto 0);
           g_max : in STD_LOGIC;
           pers_usa : in STD_LOGIC;
           viteza : in STD_LOGIC;
           et_crt : out STD_LOGIC_VECTOR(3 downto 0);
           senzor_usi: out STD_LOGIC;
           anozi: out std_logic_vector(7 downto 0);
           catozi: out std_logic_vector(6 downto 0));
end component;

signal clk: std_logic;
signal et_int4 : STD_LOGIC_VECTOR (3 downto 0);
signal et_ext12 : STD_LOGIC_VECTOR (12 downto 0);
signal g_max : STD_LOGIC;
signal pers_usa : STD_LOGIC;
signal viteza : STD_LOGIC;
signal et_crt : STD_LOGIC_VECTOR(3 downto 0);
signal anozi: std_logic_vector(7 downto 0);
signal catozi: std_logic_vector(6 downto 0);
signal s_usi: std_logic;

constant clk_period: time := 10 ns;

begin

UUT: LiftMain port map (clk, et_int4, et_ext12, g_max, pers_usa, viteza, et_crt, s_usi, anozi, catozi);

gen_clock: process(clk)
begin
    if clk = 'U' then clk <= '0';
    else clk <= not clk after clk_period/2;
    end if;
end process;

stimuli: process
begin

g_max <= '0';
pers_usa <= '0';
viteza <= '1';
et_int4 <= "1111";
et_ext12 <= "0000000000000";
wait for clk_period * 15;
et_ext12 <= "0000000100000";
wait for clk_period * 15;
et_ext12 <= "0000000000000";
pers_usa <= '0';
wait for clk_period;
et_ext12 <= "0000000001000";
wait for clk_period * 15;
et_ext12 <= "0000000000000";
wait for clk_period * 15;
et_int4 <= "1100";
wait for clk_period * 15;
et_int4 <= "1111";
wait for clk_period * 20;
et_int4 <= "0111";
wait for clk_period * 20;
et_int4 <= "1111";
wait for clk_period * 1000;

end process;

end Behavioral;
