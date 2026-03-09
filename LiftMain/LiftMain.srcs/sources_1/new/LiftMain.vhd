

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity LiftMain is
    Port ( clk: in std_logic;
           et_int4 : in STD_LOGIC_VECTOR (3 downto 0);
           et_ext12 : in STD_LOGIC_VECTOR (12 downto 0);
           g_max : in STD_LOGIC;
           pers_usa : in STD_LOGIC;
           viteza : in STD_LOGIC;
           et_crt : out STD_LOGIC_VECTOR(3 downto 0);
           senzor_usi: out STD_LOGIC;
           target_out: out STD_LOGIC_VECTOR (3 downto 0);
           anozi: out std_logic_vector(7 downto 0);
           catozi: out std_logic_vector(6 downto 0));
end LiftMain;

architecture Behavioral of LiftMain is

component dcd12_4 is
    Port ( ext : in STD_LOGIC_VECTOR (12 downto 0);
           d_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal et_ext4: std_logic_vector(3 downto 0); 

component registru is
    Port ( d_in : in STD_LOGIC_VECTOR (3 downto 0);
           load : in STD_LOGIC;
           rst : in STD_LOGIC;
           CLK : in STD_LOGIC;
           d_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component registru_et_crt is
    Port ( d_in : in STD_LOGIC_VECTOR (3 downto 0);
           load : in STD_LOGIC;
           rst : in STD_LOGIC;
           CLK : in STD_LOGIC;
           d_out : out STD_LOGIC_VECTOR (3 downto 0):= "0000");
end component;

component registru_sens is
    Port ( d_in : in STD_LOGIC_VECTOR (1 downto 0);
           load : in STD_LOGIC;
           rst : in STD_LOGIC;
           CLK : in STD_LOGIC;
           d_out : out STD_LOGIC_VECTOR (1 downto 0));
end component;

component SevenSegment is
    Port ( clk : in STD_LOGIC;
           et_crt : in STD_LOGIC_VECTOR (3 downto 0);
           s_usi : in STD_LOGIC;
           anozi : out STD_LOGIC_VECTOR (7 downto 0);
           catozi : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component DivizorFrecventa is
    Port ( CLK : in STD_LOGIC;
           Speed : in STD_LOGIC;
           CLK_D : out STD_LOGIC);
end component;

signal CLK_D: std_logic;

component GetCMD is
    Port ( et_ext : in STD_LOGIC_VECTOR (3 downto 0);
           et_int : in STD_LOGIC_VECTOR (3 downto 0);
           target : in STD_LOGIC_VECTOR (3 downto 0);
           c1 : in STD_LOGIC_VECTOR (3 downto 0);
           c2 : in STD_LOGIC_VECTOR (3 downto 0);
           CMD : out STD_LOGIC_VECTOR (3 downto 0):="1111");
end component;

component counter_etaj is
    Port ( d_in : in STD_LOGIC_VECTOR (3 downto 0);
           en : in STD_LOGIC;
           sens : in STD_LOGIC_VECTOR (1 downto 0);
           clk : in STD_LOGIC;
           d_out : out STD_LOGIC_VECTOR (3 downto 0):= "1111");
end component;

component counter_stand_by is
  Port ( clk : in std_logic;
         en : in std_logic;
         rst : in std_logic;
         carry_out : out std_logic);
end component;

signal en_counter_stand_by: std_logic;
signal rst_counter_stand_by : std_logic;
signal carry_st_by: std_logic;

component LiftControl is
    Port (  clk : in std_logic;
           g_max: in std_logic;
           pers_usa: in std_logic;
           et_crt : in STD_LOGIC_VECTOR(3 downto 0);
           target: in std_logic_vector(3 downto 0);
           c1: in std_logic_vector(3 downto 0);
           c2: in std_logic_vector(3 downto 0);
           cmd: in std_logic_vector(3 downto 0);
           sens: in std_logic_vector(1 downto 0);
           en_count_stand_by : out std_logic;
           rst_count_stand_by : out std_logic;
           carry_st_by : in std_logic;
           target_cmd: out std_logic_vector(3 downto 0);
           c1_cmd: out std_logic_vector(3 downto 0);
           c2_cmd: out std_logic_vector(3 downto 0);
           sens_out: out std_logic_vector(1 downto 0);
           en_counter: out std_logic;
           rst_et_crt: out std_logic;
           s_usi: out std_logic);
end component;

signal target: std_logic_vector(3 downto 0);
signal c1: std_logic_vector(3 downto 0);
signal c2: std_logic_vector(3 downto 0);
signal sens: std_logic_vector(1 downto 0):="11";
signal target_cmd: std_logic_vector(3 downto 0):="1111";
signal c1_cmd: std_logic_vector(3 downto 0);
signal c2_cmd: std_logic_vector(3 downto 0);
signal sens_out: std_logic_vector(1 downto 0);
signal en_counter: std_logic;
signal et_crt_reg: std_logic_vector(3 downto 0):="0000";
signal et_crt_next: std_logic_vector(3 downto 0):="0000";
signal cmd: std_logic_vector(3 downto 0);
signal cmd_reg: std_logic_vector(3 downto 0);
signal s_usi: std_logic;
signal rst_et_crt: std_logic;

begin
UT_dcd: dcd12_4 port map (et_ext12, et_ext4);
UT_divFrec: DivizorFrecventa port map(clk, viteza, CLK_D);
UT_SENS: registru_sens port map(sens_out, '1', '0', clk, sens);
UT_counter: counter_etaj port map(et_crt_reg, en_counter, sens, CLK_D, et_crt_next);
UT_ET_CRT: registru_et_crt port map(et_crt_next, '1', rst_et_crt, clk, et_crt_reg);
UT_TARGET: registru port map(target_cmd, '1', '0', clk, target);
UT_C1: registru port map(c1_cmd, '1', '0', clk, c1);
UT_C2: registru port map(c2_cmd, '1', '0', clk, c2);
UT_GET_CMD: GetCMD port map(et_ext4, et_int4, target, c1, c2, cmd);
UT_CMD: registru port map (cmd, '1', '0', clk, cmd_reg);
UT_NUMARATOR_STAND_BY: counter_stand_by port map(clk, en_counter_stand_by, rst_counter_stand_by,carry_st_by);
UT_CONTROL: LiftControl port map(clk, g_max, pers_usa, et_crt_reg, target, c1, c2, cmd_reg, sens, en_counter_stand_by, rst_counter_stand_by, carry_st_by, target_cmd, c1_cmd, c2_cmd, sens_out, en_counter, rst_et_crt, s_usi);
UT_SevSeg: SevenSegment port map(clk, et_crt_reg, s_usi, anozi, catozi);

target_out <= target;
senzor_usi <= s_usi;
et_crt <= et_crt_reg;
end Behavioral;

