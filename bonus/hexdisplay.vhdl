library IEEE;
use IEEE.std_logic_1164.all;

entity hexdisplay is
    port (
        nibble : in std_logic_vector(3 downto 0);
        hex : out std_logic_vector(7 downto 0)
    ) ;
end hexdisplay;


architecture arch of hexdisplay is
-- internal signals:

begin
    process(nibble)
    begin
        case nibble is
            when x"0"   => hex <= "00000011";
            when x"1"   => hex <= "10011111";
            when x"2"   => hex <= "00100101";
            when x"3"   => hex <= "00001101";
            when x"4"   => hex <= "10011001";
            when x"5"   => hex <= "01001001";
            when x"6"   => hex <= "01000001";
            when x"7"   => hex <= "00011111";
            when x"8"   => hex <= "00000001";
            when x"9"   => hex <= "00011001";
            when x"a"   => hex <= "00010001";
            when x"b"   => hex <= "11000001";
            when x"c"   => hex <= "01100011";
            when x"d"   => hex <= "10000101";
            when x"f"   => hex <= "01110001";
            when others => hex <= "01100001";
        end case;
    end process;
end arch;
