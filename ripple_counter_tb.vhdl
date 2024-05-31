-- Libraries
library ieee;
use ieee.std_logic_1164.all;

entity ripple_counter_tb is
    generic n : natural := 8;
end entity ripple_counter_tb;

architecture tb of ripple_counter_tb is
-- Clock Generation
    constant CLK_FREQ : integer := 100e6;
    constant CLK_PERIOD : time := 1000 ms / CLK_FREQ;
-- signals
    signal clk : std_logic := '1';
    signal clear : std_logic := '0';
    signal dout : std_logic_vector(n-1 downto 0);
begin
-- generate clock
    clk <= not clk after CLK_PERIOD / 2;
-- DUT
    DUT: work.entity ripple_counter port map (clk, clear, dout);

-- Process
test: process
begin
    wait for 52 ns;
    clear <= '1';
    wait for 12 ns;
    clear <= '0';

    wait;
end process;    
end architecture;
