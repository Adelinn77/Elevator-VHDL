library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity DivizorFrecventa is
    Port ( CLK : in STD_LOGIC;
           Speed : in STD_LOGIC;
           CLK_D : out STD_LOGIC);
end DivizorFrecventa;

architecture Behavioral of DivizorFrecventa is
signal count: integer := 0;
constant c1: integer := 7;
constant c2: integer := 7*3;
begin

process(CLK)
begin
    if rising_edge(CLK) then
        if(Speed = '1') then
            if(count < c1/2) then 
                CLK_D <= '0';
                count <= count + 1;
            elsif(count <= c1-1) then
                CLK_D <= '1';
                count <= count + 1;
            else
                count <= 0;
                CLK_D <= '0';
            end if;
        else
            if(count < c2/2) then 
                CLK_D <= '0';
                count <= count + 1;
            elsif(count <= c2-1) then
                CLK_D <= '1';
                count <= count + 1;
            else
                count <= 0;
                CLK_D <= '0';
            end if;
        end if;
   end if; 
end process;



end Behavioral;