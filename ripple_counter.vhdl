-- Libraries
library ieee;
use ieee.std_logic_1164.all;


entity ripple_counter is
    generic (
      n : natural := 8  
    );
    port (
        clk : in std_logic;
        clear : in std_logic;
        dout : out std_logic_vector(n-1 downto 0)
    );
end entity ripple_counter;

architecture arch_rtl of ripple_counter is
    signal clk_i, q_i: std_logic_vector(n-1 downto 0);

begin
    clk_i(0) <= clk;
    clk_i(n-1 downto 1) <= q_i(n-2 downto 0);

gen_cnt: for i in 0 to n-1 generate
    dff: process(clear, clk_i)
        begin
            if (clear = '1' OR q_i >= reset) then q_i(i) <= '1';
            elsif rising_edge(clk_i(i)) then q_i(i) <= not q_i(i);
            end if;
        end process dff;
    end generate;
dout <= not q_i;
end arch_rtl;



