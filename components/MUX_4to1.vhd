library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--16 bit MUX
entity MUX_4to1 is
    port (
        A : in STD_LOGIC_VECTOR(15 downto 0); -- 16-bit input when select 00
        B : in STD_LOGIC_VECTOR(15 downto 0); -- 16-bit input when select 01
        C : in STD_LOGIC_VECTOR(15 downto 0); -- 16-bit input when select 10
        D : in STD_LOGIC_VECTOR(15 downto 0); -- 16-bit input when select 11
        sel : in STD_LOGIC_VECTOR(1 downto 0); -- 2 bit select
        Y : out STD_LOGIC_VECTOR(15 downto 0) -- 16-bit output
    );
end MUX_4to1;

architecture Behavioral of MUX_4to1 is

begin
    process (sel)   
    begin
        case sel is
            when "00" =>
                Y <= A;
            when "01" =>
                Y <= B;
            when "10" =>
                Y <= C;
            when "11" =>
                Y <= D;
            when others =>
                null;
        end case;
    end process;

end Behavioral;
