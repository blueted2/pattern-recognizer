library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY compare IS
    PORT (
        reset, clk : IN std_logic;
        seg1_b, seg2_b, seg1_s, seg2_s : IN std_logic_vector(6 downto 0)
    ); 
END compare;

ARCHITECTURE behavior of compare IS
BEGIN
    PROCESS(clk, reset)
    begin
        assert (seg1_b = seg1_s and seg1_b = seg1_s) report "the signal are not equals" severity warning;
    end process;
end behavior;