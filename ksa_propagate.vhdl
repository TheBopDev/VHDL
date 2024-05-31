-- Author: Josh White
-- Date created: 2023-01-27 

--------------------------------------------------------------------------------
-- IEEE libraries
--------------------------------------------------------------------------------
library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.nermic_std;



--------------------------------------------------------------------------------
-- Entity declaration
--------------------------------------------------------------------------------
entity ksa_propagate is
    port (
    A : in std_logic;
    B : in std_logic;
    Z : out std_logic;
    ) ;
end entity ksa_propagate;


--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------

architecture behavioral of ksa_propagate is
    

begin -- architecture

    --------------------------------------------------
    -- Component declarations
    --------------------------------------------------

    Z = A XOR B;

end architecture;

