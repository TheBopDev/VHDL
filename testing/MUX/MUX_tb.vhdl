-- Author: Josh White
-- Date created:  2023-03-10
-- Date modified: 2023-03-10
-- Testbench Overview:

--------------------------------------------------------------------------------
-- IEEE libraries
--------------------------------------------------------------------------------
library IEEE;
use     IEEE.std_logic_1164.all;



--------------------------------------------------------------------------------
-- Entity declaration
--------------------------------------------------------------------------------
entity MUX_tb is
end entity MUX_tb;


--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------

architecture test of MUX_tb is
    
    --------------------------------------------------
    -- Type     declarations
    -- Constant declarations
    -- Signal   declarations
    --------------------------------------------------

    signal in1 : std_logic_vector(31 downto 0) := x"FFFF0000";
    signal in2 : std_logic_vector(31 downto 0) := x"0000FFFF";
    signal outmux : std_logic_vector(31 downto 0);
    signal sel : integer := 0;


begin -- architecture

    --------------------------------------------------
    -- Component declarations
    --------------------------------------------------
    DUT_MUX : entity work.MUX
        generic map (
            NumInputs => 2,
            BitLength => 32)
        port map (
        sel => sel,
        VectorIn(1) => in1,
        VectorIn(0) => in2,
        Output => outmux);

process is
begin
    wait for 5 ns;
    sel <= 1;
    wait for 5 ns;
    sel <= 0;
    wait for 5 ns;

    wait;
end process;




end architecture;
-- end architecture

-- end of testbench

