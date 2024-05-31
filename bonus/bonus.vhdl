-- Description of file:
-- Datapath, mostly using structural
-- Note: Registers A, B, and C are displayed using all 6 hex displays.
-- INPUT_DATA = first 8 switches
-- clk = pushbutton
-- clr = 2nd pushbutton
-- word = 9 bits (msb = carry bit)


-- Note: I didn't test this code, so I don't know if it will compile.
-- Additionally, since I couldn't communicate with the FPGA, I couldn't
-- do any pin assignments. I don't expect you to do this for me, and I
-- understand that will lower my grade. That is completely fine with me
-- I just want to write code that works (at least in theory). 

library iEEE;
use iEEE.std_logic_1164.all;
use iEEE.numeric_std.all;

entity bonus is
    port (
            clk, clr                : in      std_logic;
            op_code                 : in      std_logic_vector(1 downto 0);
            INPUT_DATA              : in      std_logic_vector(7 downto 0);
            HEX5, HEX4, HEX3        : out     std_logic_vector(7 downto 0);
            HEX2, HEX1, HEX0        : out     std_logic_vector(7 downto 0);
            LEDZ, LEDS, LEDC        : buffer  std_logic
         ) ;
end entity bonus;

architecture arch of bonus is
-- internal signals
    signal lda, ldb, ldc    : std_logic := '0';
    signal add, sub         : std_logic := '0';
    signal word             : std_logic_vector(8 downto 0);
    signal q_a, q_b, q_c    : std_logic_vector(7 downto 0);
    signal DATA_C           : std_logic_vector(7 downto 0);
    signal Z, C, S          : std_logic;

    
begin
    -- Hex displays
    DUT_HEX5: entity work.hexdisplay port map ( q_a(7 downto 4), HEX5 );
    DUT_HEX4: entity work.hexdisplay port map ( q_a(3 downto 0), HEX4 );
    DUT_HEX3: entity work.hexdisplay port map ( q_b(7 downto 4), HEX3 );
    DUT_HEX2: entity work.hexdisplay port map ( q_b(3 downto 0), HEX2 );
    DUT_HEX1: entity work.hexdisplay port map ( q_c(7 downto 4), HEX1 );
    DUT_HEX0: entity work.hexdisplay port map ( q_c(3 downto 0), HEX0 );
    
    -- Registers
    DUT_REGA: entity work.reg8b      port map ( clk, clr, lda,
            INPUT_DATA, q_a );
    DUT_REGB: entity work.reg8b      port map ( clk, clr, ldb,
            INPUT_DATA, q_b );
    DUT_REGC: entity work.reg8b      port map ( clk, clr, ldc,
            DATA_C, q_c );
    
    -- Flags
    -- These technically should be controlled by hardware, but since it's
    -- just LEDs, I'll let them be controlled via pin outputs
    LEDZ <= Z;
    LEDC <= C;
    LEDS <= S;

-- Control unit
Controller : process(clk, LEDZ, LEDC, LEDS, clr)
begin
    if rising_edge(clk) then
        word <= '0' & x"00";
        lda <= '0'; ldb <= '0';
        add <= '0'; sub <= '0';
        case op_code is
            when "00"   => lda <= '1';
            when "01"   => ldb <= '1'; 
            when "10"   => add <= '1';
            when "11"   => sub <= '1';
            when others => lda <= '0';
        end case;
    end if;
end process;

-- Datapath
Datapath : process(clk)
begin
    if rising_edge(clk) then
        if add = '1' then
            DATA_C  <= std_logic_vector(unsigned(q_a) + unsigned(q_b));
            ldc <= '1';
        end if;
        if sub = '1' then
            DATA_C  <= std_logic_vector(unsigned(q_a) + unsigned(q_b));
            ldc <= '1';
        end if;
        if q_c = x"00"          then Z  <= '1';
        elsif signed(q_c) < 0   then S  <= '1';
        elsif word(8) = '1'  then C  <= '1';
        end if;
    end if;
end process;
end architecture arch;
