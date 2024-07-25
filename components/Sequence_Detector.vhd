
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--use IEEE.NUMERIC_STD.ALL;


--Sequence detector for 11010
entity Sequence_Detector is
    port (
        Clk     : in std_logic;
        Rst     : in std_logic;
        Data_In : in std_logic;
        Seq_Detected : out std_logic
    );
end Sequence_Detector;

architecture Behavioral of Sequence_Detector is

    type states is (A,B,C,D,E);
    signal state : states := A;
begin
    process (Clk,Rst)
    begin
        if Rst = '1' then
            state <= A;
        elsif rising_edge(Clk) then
            case state is
                when A =>
                    if Data_In = '1' then
                        state <= B;
                    else
                        state <= A;
                    end if;
            
                when B =>
                    if Data_In = '1' then
                        state <= C;
                    else
                        state <= A;
                    end if;
                
                when C =>
                    if Data_In = '0' then
                        state <= D;
                    else
                        state <= C;
                    end if;
                
                when D =>
                    if Data_In = '1' then
                        state <= E;
                    else
                        state <= A;
                    end if;

                when E =>
                    if Data_In = '0' then
                        state <= B;
                        Seq_Detected <= '1';
                    else
                        state <= C;
                    end if;

                when others =>
                    null;
            end case;
        end if;
    end process;

end Behavioral;
