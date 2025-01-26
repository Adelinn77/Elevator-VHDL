
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LiftControl is
    Port ( clk : in std_logic;
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
           target_cmd: out std_logic_vector(3 downto 0):="1111";
           c1_cmd: out std_logic_vector(3 downto 0);
           c2_cmd: out std_logic_vector(3 downto 0);
           sens_out: out std_logic_vector(1 downto 0);
           en_counter: out std_logic;
           rst_et_crt : out std_logic;
           s_usi: out std_logic);
end LiftControl;

architecture Behavioral of LiftControl is

type stareLift is (IDLE, STAND_BY, MOVE_UP, MOVE_DOWN, GET_CMD, CHECK, GET_SENS, VERIFY_CMD, EN, START);
signal stare: stareLift:=START;
signal next_stare: stareLift;

signal clk_period: time := 200ns;
signal crt_cmd: std_logic_vector(3 downto 0);
signal std_by: std_logic := '0';
signal wasStandBy : std_logic := '0';

begin

ACTUALIZARE_STARE: process(clk, stare)
begin
    if(clk = '1' and clk'event) then
        stare <= next_stare;
    end if;
    
end process ACTUALIZARE_STARE;



TRANSITIONS: process
begin

    case stare is
        when START =>
            rst_count_stand_by <= '1';
            target_cmd <= "1111";
            c1_cmd <= "1111";
            c2_cmd <= "1111";
            sens_out <= "11";
            rst_et_crt <= '1';
            s_usi <= '1';
            if cmd = "1111" then
                next_stare <= START;
            elsif cmd > "0000" and cmd <= "1100" then
                next_stare <= GET_CMD;
            end if;
            
            
        when GET_CMD => 
            rst_et_crt <= '0';
             if not (target = "1111") then
                    crt_cmd <= target;
                    next_stare <= VERIFY_CMD;
             else
                if cmd = "1111" then
                    next_stare <= IDLE;
                else 
                    next_stare <= VERIFY_CMD;
                end if;
                
            end if;  
        
        when VERIFY_CMD => 
           
            if target = "1111" then
                target_cmd <= cmd;
                crt_cmd <= cmd;
            elsif c1 = "1111" and not (target = cmd) then
                c1_cmd <= cmd;
            elsif (c2 = "1111") and (not(target = cmd) and not (c1 = cmd)) and not (cmd = "1111") then 
                c2_cmd <= cmd;
            end if;
            
            if not (c1 = "1111") then
                if sens = "01" and c1 <= crt_cmd and c1 >= et_crt then
                        crt_cmd <= c1;
                    elsif sens = "10" and c1 >= crt_cmd and c1 <= et_crt  then
                        crt_cmd <= c1;
                 end if;
            end if;
            if not (c2 = "1111") then
                if sens = "01" and c2 <= crt_cmd and c2 > et_crt then
                        crt_cmd <= c2;
                    elsif sens = "10" and c2 >= crt_cmd and c2 < et_crt then
                        crt_cmd <= c2;
                 end if;
            end if;
            
            next_stare <= CHECK;
            
        when CHECK => 
            if not(et_crt = crt_cmd) then
                next_stare <= GET_SENS;
            else               
                next_stare <= STAND_BY;        
            end if;
            
        when GET_SENS => 
            if sens = "11" then
                if et_crt < crt_cmd then
                    sens_out <= "01";
                elsif et_crt > crt_cmd then
                    sens_out <= "10";
                end if;
            end if;
            next_stare <= EN;
        when EN =>
--            if(std_by = '1') then
--                next_stare <= STAND_BY;
            if g_max = '0' and pers_usa = '0' then
                s_usi <= '0';
                if sens = "01" then
                    next_stare <= MOVE_UP;
                elsif sens = "10" then
                    next_stare <= MOVE_DOWN;
                end if;
            else 
                next_stare <= STAND_BY;
            end if;
            
        when MOVE_UP =>
            en_counter <= '1';
            next_stare <= GET_CMD;
            
        when MOVE_DOWN =>
            en_counter <= '1';
            next_stare <= GET_CMD;
            
        when IDLE => 
            s_usi <= '0';
            next_stare <= GET_CMD;
            
        when STAND_BY =>
            s_usi <= '1';
--            if(carry_st_by = '0' and std_by = '0') then
--                rst_count_stand_by <= '0';
--                en_count_stand_by <= '1';
--                std_by <= '1';
--            elsif(carry_st_by = '1') then
--                en_count_stand_by <= '0';
--                std_by <= '0'; 
--                rst_count_stand_by <= '1';
--            end if;
            en_counter <= '0';
            if(crt_cmd = target) and (et_crt = crt_cmd) then
                sens_out <= "11";
                target_cmd <= c1;
                c1_cmd <= c2;
                c2_cmd <= "1111";
            elsif(crt_cmd = c1) and (et_crt = crt_cmd) then
                c1_cmd <= c2;
            elsif(crt_cmd = c2) and (et_crt = crt_cmd) then
                c2_cmd <= "1111"; 
            end if;
             next_stare <= GET_CMD; 
            --wait for clk_period;
         

            
end case;

    wait on stare, clk;
    
end process TRANSITIONS;


end Behavioral;
