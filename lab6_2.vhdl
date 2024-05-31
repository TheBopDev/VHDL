-- Libraries
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lab6_2 is
    generic (
       n : natural := 16
    );
    port (
        max10_clk : in std_logic;
        SPI_SDI : out std_logic;
        SPI_SDO : in std_logic;
        SPI_CSN : out std_logic;
        SPI_CLK : out std_logic;
        key0 : in std_logic;
        LEDR0 : out std_logic;
        HEX5, HEX4, HEX3, HEX2, HEX1, HEX0: out std_logic_vector(6 downto 0)
    );
end entity lab6_2;

architecture arch_rtl of lab6_2 is
-- Clock Generatoin
    constant CLK_FREQ : integer := 50;
    constant CLK_PERIOD : time := 1000 ms / CLK_FREQ;
-- Signals
    signal clk : std_logic := '1';
    signal clear : std_logic := '0'; -- clear on high
    signal dout : std_logic_vector(n-1 downto 0);
    signal count : std_logic_vector(n-1 downto 0) := x"0000";
    variable timevar : time := CLK_PERIOD / 2;
    signal reset_n : std_logic := '0';
    signal data_valid : std_logic;
    signal data_x, data_y, data_z : std_logic_vector(n-1 downto 0);
begin
-- Component(s)
    DUT : work.entity ADXL345_controller port map (
        reset_n, max10_clk, data_valid, data_x, data_y, data_z,
        SPI_SDI, SPI_SDO, SPI_CSN, SPI_CLK);
-- Display the count data to the board
    UUT_HEX3 : work.entity bcd_7segment port map (count(15 downto 12), HEX3);
    UUT_HEX2 : work.entity bcd_7segment port map (count(11 downto 8), HEX2);
    UUT_HEX1 : work.entity bcd_7segment port map (count(7 downto 4), HEX1);
    UUT_HEX0 : work.entity bcd_7segment port map (count(3 downto 0), HEX0);

-- Generate my clock
    clk <= not clk after timevar ;

-- Calculate new clock period
-- (only update when our angle changes)
    process (data_x)
    begin
        timevar := CLK_PERIOD / unsigned(data_x(11 downto 8));
    end process;

-- Updown Counter process
-- Note: data_x(15) is the direction bit. 1 is count up, 0 is count down.
    process (clk)
    begin
        if (key0 = '1') then count <= x"0000"; -- clear count
        elsif rising_edge(clk) then
            if (data_x(15) = '1') then count <= signed(count) + 1;
            elsif (data_x(15) = '0') then count <= signed(count) - 1;
            end if;
        end if;
    end process;

    
end arch_rtl;
