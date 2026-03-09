----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/30/2024 01:00:00 PM
-- Design Name: 
-- Module Name: tb_DivizorFrecventa - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench for DivizorFrecventa
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

entity tb_DivizorFrecventa is
--  Port ( );
end tb_DivizorFrecventa;

architecture Behavioral of tb_DivizorFrecventa is

    component DivizorFrecventa is
        port ( clk: in std_logic;
               clock_out: out std_logic
        );
    end component;

    signal clk: std_logic := '0';
    signal clock_out: std_logic;

    constant clk_period : time := 20 ns; -- 50 MHz clock

begin

    uut: DivizorFrecventa
        port map (
            clk => clk,
            clock_out => clock_out
        );

    -- Clock process definitions
    clk_process :process
    begin
        while now < 1 ms loop -- Run for 1 ms (you can adjust as needed)
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stim_proc: process
    begin		
        -- wait for the global reset
        wait for 100 ns;

        -- Insert stimulus here

        -- Finish the simulation after some time
        wait for 10 ms;
        assert false report "Simulation Ended" severity failure;
    end process;

end Behavioral;