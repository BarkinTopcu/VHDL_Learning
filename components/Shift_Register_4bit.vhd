library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--This shift register is shifting to right side
-- i_serial = 1 -> o_parallel = 1000
-- i_serial = 0 -> o_parallel = 0100
-- i_serial = 1 -> o_parallel = 1010
-- i_serial = 1 -> o_parallel = 1101

entity Shift_Register_4bit is
    port (
        CLK         : in std_logic;
        RST         : in std_logic;
        i_serial    : in std_logic;
        o_parallel  : out std_logic_vector(3 downto 0)
    );
end Shift_Register_4bit;

architecture Behavioral of Shift_Register_4bit is

    signal temp_signal  : std_logic_vector(3 downto 0) := "0000";

begin
process (CLK, RST)
begin
    if RST = '1' then
        temp_signal <= (others => '0');
    elsif rising_edge(CLK) then
        temp_signal <= i_serial & temp_signal(3 downto 1);        
    end if;
end process;

    o_parallel <= temp_signal;
end Behavioral;
