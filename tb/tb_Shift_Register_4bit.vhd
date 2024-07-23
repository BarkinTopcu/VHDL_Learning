library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_Shift_Register_4bit is
end tb_Shift_Register_4bit;

architecture Behavioral of tb_Shift_Register_4bit is

    component Shift_Register_4bit
    port (
        CLK         : in std_logic;
        RST         : in std_logic;
        i_serial    : in std_logic;
        o_parallel  : out std_logic_vector(3 downto 0)
    );
    end component;

    signal CLK         : std_logic := '0';
    signal RST         : std_logic := '0';
    signal i_serial    : std_logic := '0';
    signal o_parallel  : std_logic_vector(3 downto 0);
    constant CLK_period : time := 10 ns;

begin

    -- Unit Under Test (UUT)
    uut: Shift_Register_4bit
        port map (
            CLK => CLK,
            RST => RST,
            i_serial => i_serial,
            o_parallel => o_parallel
        );

    CLK_process :process
    begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
    end process;

    stim_proc: process
    begin
        RST <= '1';
        wait for 20 ns;
        RST <= '0';

        i_serial <= '1';
        wait for CLK_period*4;

        i_serial <= '0';
        wait for CLK_period*4;

        i_serial <= '1';
        wait for CLK_period*4;

        i_serial <= '1';
        wait for CLK_period*4;

        wait;
    end process;
end Behavioral;
