library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


use IEEE.NUMERIC_STD.ALL;

entity tb_Sequence_Detector is
end tb_Sequence_Detector;

architecture Behavioral of tb_Sequence_Detector is

    signal Clk      : std_logic;
    signal Rst      : std_logic;
    signal Data_In  : std_logic;
    signal Seq_Detected : std_logic;

    constant Clk_Period : time := 10 ns;
    
    component Sequence_Detector
        port (
            Clk     : in std_logic;
            Rst     : in std_logic;
            Data_In : in std_logic;
            Seq_Detected : out std_logic
        );
    end component;

begin

    uut : Sequence_Detector
        port map (
            Clk     => Clk,
            Rst     => Rst,
            Data_In => Data_In,
            Seq_Detected => Seq_Detected
        );

    CLK_process : process 
    begin
        CLK <= '0';
        wait for Clk_Period/2;
        CLK <= '1';
        wait for Clk_Period/2;
    end process;

    stim_proc : process
    begin
        RST <= '1';
        wait for Clk_Period;
        RST <= '0';
        wait for Clk_Period;
        Data_In <= '1';
        wait for Clk_Period;
        Data_In <= '0';
        wait for Clk_Period;
        Data_In <= '0';
        wait for Clk_Period;
        Data_In <= '1';
        wait for Clk_Period;
        Data_In <= '1';
        wait for Clk_Period;
        Data_In <= '0';
        wait for Clk_Period;
        Data_In <= '1';
        wait for Clk_Period;
        Data_In <= '0';
        wait;
    end process;
end Behavioral;
