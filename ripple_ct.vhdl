-- Libraries
library ieee;
use ieee.std_logic_1164.all;

entity ripple_ct is
    generic (
       n : natural := 8 
    );
    port (
--        clk : in std_logic;
        clear : in std_logic;
        dout : out std_logic_vector(n-1 downto 0);
        LEDR0 : out std_logic
    );
end entity ripple_ct;


architecture arch_rtl of ripple_ct is
-- Clock generation
    constant CLK_FREQ : integer := 100e6;
    constant CLK_PERIOD : time := 1000 ms / CLK_FREQ;
-- Signals
    signal clk_i, q_i : std_logic_vector(n-1 downto 0);
    signal clk : std_logic := '1';

begin
    clk <= not clk after CLK_PERIOD / 2;
    clk_i(0) <= clk;
    clk_i(n-1 downto 1) <= q_i(n-2 downto 0);

gen_cnt: for i in 0 to n-1 generate
    dff: process(clear, clk_i)
    begin
        if (clear = '1') then q_i(i) <= '1';
        elsif (q_i >= reset) then q_i(i) <= '1';
        elsif rising_edge(clk_i(i)) then q_i(i) <= not q_i(i);
        end if;
    end process dff;
end generate;
dout <= not q_i;


end arch_rtl;
