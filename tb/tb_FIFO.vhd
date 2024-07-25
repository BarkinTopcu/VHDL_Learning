library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity tb_FIFO is
end tb_FIFO;

architecture Behavioral of tb_FIFO is

    component FIFO is
        generic (
            DATA_WIDTH : integer := 8;
            FIFO_DEPTH : integer := 16
        );
        port (
            Clk     : in std_logic;
            Rst     : in std_logic;
            WR_En   : in std_logic;
            RD_En   : in std_logic;
            Data_In : in std_logic_vector(DATA_WIDTH-1 downto 0);
            Data_Out: out std_logic_vector(DATA_WIDTH-1 downto 0);
            Full    : out std_logic;
            Empty   : out std_logic
        );
    end component;

    constant DATA_WIDTH : integer := 8;
    constant FIFO_DEPTH : integer := 16;
    signal Clk     : std_logic := '0';
    signal Rst     : std_logic := '0';
    signal WR_En   : std_logic := '0';
    signal RD_En   : std_logic := '0';
    signal Data_In : std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
    signal Data_Out: std_logic_vector(DATA_WIDTH-1 downto 0);
    signal Full    : std_logic;
    signal Empty   : std_logic;

    constant Clk_Period : time := 10 ns;
begin

    uut: FIFO
        port map (
            Clk => Clk,
            Rst => Rst,
            WR_En => WR_En,
            RD_En => RD_En,
            Data_In => Data_In,
            Data_Out => Data_Out,
            Full => Full,
            Empty => Empty
        );

    CLK_process :process
    begin
        Clk <= '0';
        wait for Clk_Period/2;
        Clk <= '1';
        wait for Clk_Period/2;
    end process;

    stim_procc : process
    begin
        RST <= '1';
        WR_En <= '0';
        RD_En <= '0';
        Data_In <= (others => '0');
        wait for Clk_Period*2;
        RST <= '0';
        wait for Clk_Period*2;

        --Write FIFO
        for i in 0 to FIFO_DEPTH-1 loop
            WR_En <= '1';
            Data_In <= std_logic_vector(to_unsigned(i,DATA_WIDTH));
            wait for Clk_Period;
        end loop;

        WR_En <= '0';

        for i in 0 to FIFO_DEPTH-1 loop
            RD_En <= '1';
            wait for Clk_Period;
        end loop;
        RD_En <= '0';


        for i in 0 to 5 loop
            WR_En <= '1';
            Data_In <= std_logic_vector(to_unsigned(i+2,DATA_WIDTH));
            wait for Clk_Period;
        end loop;

        WR_En <= '0';

        for i in 0 to 4 loop
            RD_En <= '1';
            wait for Clk_Period;
        end loop;
        RD_En <= '0';
        wait for Clk_Period;

        for i in 0 to 6 loop
            WR_En <= '1';
            Data_In <= std_logic_vector(to_unsigned(i+3,DATA_WIDTH));
            wait for Clk_Period;
        end loop;
        WR_En <= '0';
        wait for Clk_Period;
        RD_En <= '1';
        wait for Clk_Period;
        RD_En <= '0';
        wait;
    end process;


end Behavioral;
