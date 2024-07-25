library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;


entity FIFO is
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
end FIFO;

architecture Behavioral of FIFO is
    type memory_array is array (0 to FIFO_DEPTH -1) of std_logic_vector(DATA_WIDTH-1 downto 0);
    signal memory : memory_array:= (others => (others => '0'));
    signal WR_ptr : integer range 0 to FIFO_DEPTH - 1 := 0;
    signal RD_ptr : integer range 0 to FIFO_DEPTH - 1 := 0;
    signal Count  : integer range 0 to FIFO_DEPTH := 0;
    signal Internal_Full  : std_logic;
    signal Internal_Empty : std_logic;

begin
    process (Clk, Rst)
    begin
        if Rst = '1' then
            WR_ptr <= 0;
            RD_ptr <= 0;
            Count <= 0;
            Data_out <=(others => '0');
        elsif rising_edge(Clk) then

            if Count = FIFO_DEPTH then
                Internal_Full <= '1';
                Internal_Empty <= '0';
            elsif Count = 0 then
                Internal_Full <= '0';
                Internal_Empty <= '1';
            else
                Internal_Full <= '0';
                Internal_Empty <= '0';
            end if;

            if WR_En = '1' and Internal_Full = '0' then
                memory(WR_ptr) <= Data_In;
                WR_ptr <= (WR_ptr + 1) mod FIFO_DEPTH;
                Count <= Count + 1;
            end if;

            if RD_En = '1' and Internal_Empty = '0' then
                Data_Out <= memory(RD_ptr);
                RD_ptr <= (RD_ptr + 1) mod FIFO_DEPTH;
                Count <= Count - 1;
            end if;
        end if;


    end process;

    Full <= Internal_Full;
    Empty <= Internal_Empty;

end Behavioral;
