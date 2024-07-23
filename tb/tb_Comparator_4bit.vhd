library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_Comparator_4bit is
end tb_Comparator_4bit;

architecture Behavioral of tb_Comparator_4bit is

    component Comparator_4bit
        Port (
            A : in  STD_LOGIC_VECTOR (3 downto 0);
            B : in  STD_LOGIC_VECTOR (3 downto 0);
            A_gt_B : out STD_LOGIC;
            A_lt_B : out STD_LOGIC;
            A_eq_B : out STD_LOGIC
        );
    end component;

    -- Signals of UUT
    signal A : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal B : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal A_gt_B : STD_LOGIC;
    signal A_lt_B : STD_LOGIC;
    signal A_eq_B : STD_LOGIC;
begin
    -- Unit Under Test (UUT)
    uut: Comparator_4bit
        Port map (
            A => A,
            B => B,
            A_gt_B => A_gt_B,
            A_lt_B => A_lt_B,
            A_eq_B => A_eq_B
        );

    stimulus: process
    begin
        -- Test Case 1: A = 0000, B = 0000 (A == B)
        A <= "0000";
        B <= "0000";
        wait for 10 ns;
        assert (A_gt_B = '0' and A_lt_B = '0' and A_eq_B = '1')
            report "Test Case 1 Failed" severity error;

        -- Test Case 2: A = 0001, B = 0000 (A > B)
        A <= "0001";
        B <= "0000";
        wait for 10 ns;
        assert (A_gt_B = '1' and A_lt_B = '0' and A_eq_B = '0')
            report "Test Case 2 Failed" severity error;

        -- Test Case 3: A = 0000, B = 0001 (A < B)
        A <= "0000";
        B <= "0001";
        wait for 10 ns;
        assert (A_gt_B = '0' and A_lt_B = '1' and A_eq_B = '0')
            report "Test Case 3 Failed" severity error;

        -- Test Case 4: A = 1010, B = 0101 (A > B)
        A <= "1010";
        B <= "0101";
        wait for 10 ns;
        assert (A_gt_B = '1' and A_lt_B = '0' and A_eq_B = '0')
            report "Test Case 4 Failed" severity error;

        -- Test Case 5: A = 0101, B = 1010 (A < B)
        A <= "0101";
        B <= "1010";
        wait for 10 ns;
        assert (A_gt_B = '0' and A_lt_B = '1' and A_eq_B = '0')
            report "Test Case 5 Failed" severity error;

        -- Test Case 6: A = 1111, B = 1111 (A == B)
        A <= "1111";
        B <= "1111";
        wait for 10 ns;
        assert (A_gt_B = '0' and A_lt_B = '0' and A_eq_B = '1')
            report "Test Case 6 Failed" severity error;

        -- Test Case 7: A = 0110, B = 0111 (A < B)
        A <= "0110";
        B <= "0111";
        wait for 10 ns;
        assert (A_gt_B = '0' and A_lt_B = '1' and A_eq_B = '0')
            report "Test Case 7 Failed" severity error;

        -- Test Case 8: A = 1001, B = 1000 (A > B)
        A <= "1001";
        B <= "1000";
        wait for 10 ns;
        assert (A_gt_B = '1' and A_lt_B = '0' and A_eq_B = '0')
            report "Test Case 8 Failed" severity error;

        -- Test complete
        wait;
    end process;

end Behavioral;
