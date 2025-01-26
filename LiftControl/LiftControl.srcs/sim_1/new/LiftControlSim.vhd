----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2024 01:31:53 PM
-- Design Name: 
-- Module Name: control_sim - Behavioral
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

entity control_sim is
--  Port ( );
end control_sim;

architecture Behavioral of control_sim is
component LiftControl is
    Port ( clk : in std_logic;
           s_usi: out std_logic;
           g_max: in std_logic;
           pers_usa: in std_logic;
           et_crt : in STD_LOGIC_VECTOR(3 downto 0);
           target: in std_logic_vector(3 downto 0);
           c1: in std_logic_vector(3 downto 0);
           c2: in std_logic_vector(3 downto 0);
           cmd: in std_logic_vector(3 downto 0);
           sens: in std_logic_vector(1 downto 0);
           compara_et_crt: in std_logic_vector(1 downto 0);
           rstTarget: out STD_LOGIC;
           rstC1 : out std_logic; 
           rstC2 : out std_logic; 
           target_cmd: out std_logic_vector(3 downto 0);
           c1_cmd: out std_logic_vector(3 downto 0);
           c2_cmd: out std_logic_vector(3 downto 0);
           sens_out: out std_logic_vector(1 downto 0);
           set_et_crt: out std_logic;
           en_counter: out std_logic;
           load_sens: out std_logic;
           rst_sens: out std_logic);
end component;


signal clk : std_logic;
signal s_usi: std_logic;
signal g_max: std_logic;
signal pers_usa: std_logic;
signal et_crt : STD_LOGIC_VECTOR(3 downto 0);
signal target: std_logic_vector(3 downto 0);
signal c1: std_logic_vector(3 downto 0);
signal c2: std_logic_vector(3 downto 0);
signal cmd: std_logic_vector(3 downto 0);
signal sens: std_logic_vector(1 downto 0);
signal compara_et_crt: std_logic_vector(1 downto 0);
signal rstTarget: STD_LOGIC;
signal rstC1 : std_logic; 
signal rstC2 : std_logic; 
signal target_cmd: std_logic_vector(3 downto 0);
signal c1_cmd: std_logic_vector(3 downto 0);
signal c2_cmd: std_logic_vector(3 downto 0);
signal sens_out: std_logic_vector(1 downto 0);
signal set_et_crt: std_logic;
signal en_counter: std_logic;
signal load_sens: std_logic;
signal rst_sens: std_logic;
constant clk_period: time := 10 ns;
begin
uut: LiftControl port map(clk, s_usi, g_max, pers_usa, et_crt, target, c1, c2, cmd, sens, compara_et_crt, rstTarget, rstC1, rstC2, target_cmd, c1_cmd, c2_cmd, sens_out, set_et_crt, en_counter, load_sens, rst_sens);
gen_clock: process(clk)
begin
    if clk = 'U' then clk <= '0';
    else clk <= not clk after clk_period/2;
    end if;
end process;
stimuli: process
begin
    cmd <= "1111";
    et_crt <= "0000";
    g_max <= '0';
    pers_usa <= '0';
    target <= "1111";
    c1 <= "1111";
    c2 <= "1111";
    sens <= "11";
wait for clk_period*10;
    cmd <= "0111";
wait for clk_period*10;
    cmd <= "0100";
wait for clk_period*10;
    cmd <= "1100";
wait for clk_period*10;
    cmd <= "0010";
wait for clk_period*10;    
end process;



end Behavioral;




