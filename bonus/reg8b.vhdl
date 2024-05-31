-- Description of entity:
-- This entity implements an 8 bit register using asynchronous active-low clear



library iEEE;
use     iEEE.std_logic_1164.all;


entity reg8b is
    port (
        clk, clr, en    : in        std_logic;
        d               : in        std_logic_vector(7 downto 0);
        q               : buffer    std_logic_vector(7 downto 0)
         ) ;
end entity reg8b;


architecture arch of reg8b is
-- Internal signals
    
begin
    process(clk,clr)
    begin
        if (clr = '0') then q <= x"00";
        elsif (en = '1') then
            if rising_edge(clk) then q <= d;
            else q <= q;
            end if;
        end if;
    end process;


end architecture arch;
