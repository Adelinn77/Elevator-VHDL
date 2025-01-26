
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity GetCMD is
    Port ( et_ext : in STD_LOGIC_VECTOR (3 downto 0);
           et_int : in STD_LOGIC_VECTOR (3 downto 0);
           target : in STD_LOGIC_VECTOR (3 downto 0);
           c1 : in STD_LOGIC_VECTOR (3 downto 0);
           c2 : in STD_LOGIC_VECTOR (3 downto 0);
           CMD : out STD_LOGIC_VECTOR (3 downto 0));
end GetCMD;

architecture Behavioral of GetCMD is

begin

setCMD: process(et_ext, et_int)
begin
    if not (et_ext = "1111") and not(target = et_ext) and not (c1 = et_ext) and not (c2 = et_ext) then
        CMD <= et_ext;
    elsif not (et_int = "1111") and not (target = et_int) and not(c1 = et_int) and not (c2 = et_int) then
        CMD <= et_int;
    elsif( et_int = "1111" and et_ext = "1111") then
        CMD <= "1111";
    end if;
   
end process;

end Behavioral;
