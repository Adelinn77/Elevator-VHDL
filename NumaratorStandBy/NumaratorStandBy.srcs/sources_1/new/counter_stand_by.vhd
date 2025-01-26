library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_stand_by is
  Port ( clk : in std_logic;
         en : in std_logic;
         rst: in std_logic;
         carry_out : out std_logic:='0');
end counter_stand_by;

architecture Behavioral of counter_stand_by is
signal count: integer := 0;
signal waiting: integer := 5;
begin

process(clk, en)
begin
    if rising_edge(clk) then
        if rst = '1' then
            count <= 0;
            carry_out <= '0';
        elsif en = '1' then        
            if count < waiting then
                count <= count + 1;
            else
                carry_out <= '1';
            end if;
        end if;
    end if;
end process;  -- Example carry out condition
end Behavioral;