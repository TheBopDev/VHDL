-- Author: Josh White
-- Date created: 

--------------------------------------------------------------------------------
-- IEEE libraries
--------------------------------------------------------------------------------
library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.nermic_std;



--------------------------------------------------------------------------------
-- Entity declaration
--------------------------------------------------------------------------------
entity ksa_pg_block is
    generic (
    _GENERIC_ : _TYPE_ := _VALUE_
    ) ;

    port (
    A_i, B_i : in  std_logic;
    P_i, G_i : out std_logic
    ) ;
end entity ksa_pg_block ;


--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------

architecture behavior of ksa_pg_block is
    
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

    P_i = A_i XOR B_i;
    G_i = A_i AND B_i;


end architecture;

