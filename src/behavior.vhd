library ieee;
library work;

use work.seven_seg.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY pattern_recognizer IS
    PORT (
        data, reset, clk : IN std_logic;
        seg1, seg2 : OUT std_logic_vector(6 downto 0)
    ); 
END pattern_recognizer;

ARCHITECTURE behavior of pattern_recognizer IS
BEGIN
    PROCESS(reset, clk)
        VARIABLE last_bits : std_logic_vector(4 DOWNTO 0);
        VARIABLE count, first_digit, second_digit : integer := 0;
        -- <your declarations>
        BEGIN
        -- no code here
        if reset='0' then -- reset is active low
            count := 0;
            last_bits := "00000";
            seg1 <= int_to_7_seg(10);
            seg2 <= int_to_7_seg(10);
            -- reset actions
        elsif rising_edge(clk) then
            -- shift last_bits to the left by one and append new data
            last_bits := last_bits(3 DOWNTO 0) & data;

            if count > 99 then
                -- in function int_to_7_seg it will return - -
                first_digit := 10;
                second_digit := 10;
            else
                first_digit := count mod 10;
                second_digit := (count - first_digit) / 10;
            end if;

            if last_bits = "11000" then
                count := count + 1;
            end if;

            seg1 <= int_to_7_seg(first_digit);
            seg2 <= int_to_7_seg(second_digit);

            -- seg1 <= "00" & std_logic_vector(last_bits);
            -- synchronous actions (sequential)
        end if;
        -- no code here
    END PROCESS;
END behavior;