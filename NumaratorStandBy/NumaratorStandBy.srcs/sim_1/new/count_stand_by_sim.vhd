library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_stand_by_tb is
end counter_stand_by_tb;

architecture Behavioral of counter_stand_by_tb is
    -- Component declaration of the Unit Under Test (UUT)
    component counter_stand_by
    Port ( clk : in std_logic;
           en : in std_logic;
           carry_out : out std_logic);
    end component;

    -- Testbench signals
    signal clk_tb : std_logic := '0';
    signal en_tb : std_logic := '0';
    signal carry_out_tb : std_logic;

    -- Clock period definition
    constant clk_period : time := 10 ns;
    
begin
    -- Instantiate the Unit Under Test (UUT)
    uut: counter_stand_by Port Map (
        clk => clk_tb,
        en => en_tb,
        carry_out => carry_out_tb
    );

    -- Clock process definitions
    clk_process :process
    begin
        clk_tb <= '0';
        wait for clk_period/2;
        clk_tb <= '1';
        wait for clk_period/2;
    end process;
    
    -- Stimulus process
    stim_proc: process
    begin
        -- Hold reset state for 20 ns.
        wait for 20 ns;

        en_tb <= '1'; -- Enable counter
        wait for 100000 ns; -- Wait to see the counter increment

        -- End of test
        wait;
    end process;

end Behavioral;