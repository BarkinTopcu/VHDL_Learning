library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Comparator_4bit is
    port (
        A       : in std_logic_vector(3 downto 0);
        B       : in std_logic_vector(3 downto 0);
        A_gt_B  : out std_logic;    -- A > B
        A_lt_B  : out std_logic;    -- A < B
        A_eq_B  : out std_logic    -- A = B
    );
end Comparator_4bit;

architecture Behavioral of Comparator_4bit is

begin
    process (A,B)   
    begin
        if unsigned(A) > unsigned(B) then
            A_gt_B <= '1';
            A_lt_B <= '0';
            A_eq_B <= '0';
        elsif unsigned(A) < unsigned(B) then
            A_gt_B <= '0';
            A_lt_B <= '1';
            A_eq_B <= '0';
        else
            A_gt_B <= '0';
            A_lt_B <= '0';
            A_eq_B <= '1';
        end if;
    end process;

end Behavioral;
