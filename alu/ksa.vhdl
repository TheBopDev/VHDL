-- Author: Josh White
-- Date created: 2023-01-29
-- Date modified: 2023-02-01

--------------------------------------------------------------------------------
-- IEEE libraries
--------------------------------------------------------------------------------
library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.nermic_std;



--------------------------------------------------------------------------------
-- Entity declaration
--------------------------------------------------------------------------------
entity ksa is
    port (
    A, B    : in  std_logic_vector(31 downto 0);
    Cin     : in  std_logic;
    S       : out std_logic_vector(31 downto 0);
    Cout    : out std_logic
    ) ;
end entity ksa ;


--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------

architecture _ARCH_TYPE_ of ksa is
    
    --------------------------------------------------
    -- Type     declarations
    -- Constant declarations
    -- Signal   declarations
    --------------------------------------------------


begin -- architecture

    --------------------------------------------------
    -- Component declarations
    --------------------------------------------------
    DUT_EX : entity work.DUT_EX
        generic map (n)
        port map (A, B, C);

    KSA_

end architecture;

