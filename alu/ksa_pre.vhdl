-- Author: Josh White
-- Date created: 2023-01-29

--------------------------------------------------------------------------------
-- IEEE libraries
--------------------------------------------------------------------------------
library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.nermic_std;



--------------------------------------------------------------------------------
-- Entity declaration
--------------------------------------------------------------------------------
entity ksa_pre is
    port (
    A, B    : in  std_logic_vector(31 downto 0);
    p, g    : out std_logic_vector(31 downto 0)
    ) ;
end entity ksa_pre;


--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------

architecture _ARCH_TYPE_ of ksa_pre is
    
    --------------------------------------------------
    -- Type     declarations
    -- Constant declarations
    -- Signal   declarations
    --------------------------------------------------


begin -- architecture

    --------------------------------------------------
    -- Component declarations
    --------------------------------------------------
    p = A XOR B;
    g = A AND B;


end architecture;

