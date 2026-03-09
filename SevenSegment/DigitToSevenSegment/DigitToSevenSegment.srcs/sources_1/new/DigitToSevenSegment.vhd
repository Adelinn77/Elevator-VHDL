library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity DigitToSevenSegment is
    Port ( CLK : in STD_LOGIC;
           D_in : in STD_LOGIC_VECTOR (3 downto 0);
           D_out : out STD_LOGIC_VECTOR (6 downto 0));
end DigitToSevenSegment;

architecture Behavioral of DigitToSevenSegment is
begin

TRANSFORM: process(CLK)
begin
    case D_in is
        when "0000" => D_out <= "1000000"; 
        when "0001" => D_out <= "1111001"; 
        when "0010" => D_out <= "0100100"; 
        when "0011" => D_out <= "0110000"; 
        when "0100" => D_out <= "0011001"; 
        when "0101" => D_out <= "0010010"; 
        when "0110" => D_out <= "0000010"; 
        when "0111" => D_out <= "1111000"; 
        when "1000" => D_out <= "0000000"; 
        when "1001" => D_out <= "0010000"; 
        when "1101" => D_out <= "1001111";
        when others => D_out <= "1111111";
        
    end case;
end process;

end Behavioral;
