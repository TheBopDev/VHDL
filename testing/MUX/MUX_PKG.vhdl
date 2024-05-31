-- Author: Josh White
-- Date created:  2023-02-26
-- Date modified: 2023-03-10
-- Overview:
--      This is the package file used in the MUX.
--      Just used to make code a little more pretty.

--------------------------------------------------------------------------------
-- IEEE libraries
--------------------------------------------------------------------------------
library IEEE;
use     IEEE.std_logic_1164.all;

package MUX_PKG is

    signal BitLength : positive := 32;
    type LVA is array (natural range <>) of std_logic_vector(BitLength -1 downto 0);

end package MUX_PKG;
