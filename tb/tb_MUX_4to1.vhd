library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_MUX_4to1 is
end tb_MUX_4to1;

architecture Behavioral of tb_MUX_4to1 is

    component MUX_4to1 is
        port (
            A : in STD_LOGIC_VECTOR(15 downto 0);
            B : in STD_LOGIC_VECTOR(15 downto 0);
            C : in STD_LOGIC_VECTOR(15 downto 0);
            D : in STD_LOGIC_VECTOR(15 downto 0);
            sel : in STD_LOGIC_VECTOR(1 downto 0);
            Y : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    signal A_tb, B_tb, C_tb, D_tb : STD_LOGIC_VECTOR(15 downto 0);
    signal sel_tb : STD_LOGIC_VECTOR(1 downto 0);
    signal Y_tb : STD_LOGIC_VECTOR(15 downto 0);

begin

    uut: MUX_4to1 port map (
        A => A_tb,
        B => B_tb,
        C => C_tb,
        D => D_tb,
        sel => sel_tb,
        Y => Y_tb
    );

    stim_proc: process
    begin        

        A_tb <= X"0001";
        B_tb <= X"0010";
        C_tb <= X"0100";
        D_tb <= X"1000";
        sel_tb <= "00";
        wait for 10 ns;
        
        sel_tb <= "01";
        wait for 10 ns;
        
        sel_tb <= "10";
        wait for 10 ns;
        
        sel_tb <= "11";
        wait for 10 ns;

        wait;
    end process;

end Behavioral;
