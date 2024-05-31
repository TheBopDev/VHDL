-- Author: Josh White
-- Date created:  2023-02-26
-- Date modified: 2023-03-10
-- Overview:
--      An overly generic MUX. It dynamically changes size of both # of inputs,
--      and # of corresponding bits.

--------------------------------------------------------------------------------
-- IEEE libraries
--------------------------------------------------------------------------------
library IEEE;
use     IEEE.std_logic_1164.all;

library work;
use     work.MUX_PKG.all;


--------------------------------------------------------------------------------
-- Entity declaration
--------------------------------------------------------------------------------
entity MUX is
    generic (
    NumInputs   : positive := 2;
    BitLength   : positive := 32
    ) ;

    port (
    VectorIn    : in  work.MUX_PKG.LVA(NumInputs - 1 downto 0);
    Sel         : in  integer range NumInputs - 1 downto 0;
    Output      : out std_logic_vector(BitLength - 1 downto 0)
    ) ;
end entity MUX;


--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------

architecture behavior of MUX is
    
    --------------------------------------------------
    -- Type     declarations
    -- Constant declarations
    -- Signal   declarations
    --------------------------------------------------


begin -- architecture

    --------------------------------------------------
    -- Component declarations
    --------------------------------------------------
    Output <= VectorIn(Sel);

end architecture;

