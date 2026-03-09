

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SevenSegment is
    Port ( clk : in STD_LOGIC;
           et_crt : in STD_LOGIC_VECTOR (3 downto 0);
           s_usi : in STD_LOGIC;
           anozi : out STD_LOGIC_VECTOR (7 downto 0);
           catozi : out STD_LOGIC_VECTOR (6 downto 0));
end SevenSegment;

architecture Behavioral of SevenSegment is

component DigitToSevenSegment is
    Port ( CLK : in STD_LOGIC;
           D_in : in STD_LOGIC_VECTOR (3 downto 0);
           D_out : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component counter_7seg is
    Port ( clk : in STD_LOGIC;
           d_out : out STD_LOGIC_VECTOR (16 downto 0));
end component;

component dcd_et is
    Port ( et_crt : in STD_LOGIC_VECTOR (3 downto 0);
           zec : out STD_LOGIC_VECTOR (3 downto 0):= "0000";
           uni : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component dcd_usi is
    Port ( s_usi : in STD_LOGIC;
           left : out STD_LOGIC_VECTOR (3 downto 0);
           right : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component mux8_1 is
    Port ( sel : in STD_LOGIC_VECTOR (2 downto 0);
           d_out : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component mux8_1afisaj is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           c : in STD_LOGIC_VECTOR (3 downto 0);
           d : in STD_LOGIC_VECTOR (3 downto 0);
           d_out : out STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC_VECTOR (2 downto 0));
end component;

signal zec, uni: std_logic_vector (3 downto 0);
signal left, right: std_logic_vector (3 downto 0);
signal counter_out: std_logic_vector (16 downto 0);
signal mux_catozi: std_logic_vector (3 downto 0);

begin

f1: dcd_et port map(et_crt, zec, uni);
f2: dcd_usi port map(s_usi, left, right);
f3: counter_7seg port map(clk, counter_out);
f4: mux8_1 port map(counter_out(16 downto 14), anozi);
f5: mux8_1afisaj port map(zec, uni, left, right, mux_catozi,counter_out(16 downto 14));
f6: digitToSevenSegment port map(clk, mux_catozi, catozi);



end Behavioral;
