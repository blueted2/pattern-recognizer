library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY pattern_recognizer IS
    PORT (
        data, reset, clk : IN std_logic;
        seg1, seg2 : OUT std_logic_vector(6 downto 0)
    ); 

END;

ARCHITECTURE behavior of pattern_recognizer IS
SIGNAL count_sig : integer;

function int_to_7_seg(val : integer) return std_logic_vector IS 
    BEGIN
        case val is 
            when 0 => return "1111110";
            when 1 => return "0110000";
            when 2 => return "1101101";
            when 3 => return "1111001";
            when 4 => return "0110011";
            when 5 => return "1011011";
            when 6 => return "1011111";
            when 7 => return "1110000";
            when 8 => return "1111110";
            when 9 => return "1111011";
            when others => return "0000001";
        END case;
    END function;
BEGIN
    PROCESS(reset, clk)
        VARIABLE last_bits : std_logic_vector(4 DOWNTO 0);
        VARIABLE count, first_digit, second_digit : integer;
        -- <your declarations>
        BEGIN
        -- no code here
        if reset='0' then -- reset is active low
            count := 0;
            last_bits := "00000";
            -- reset actions
        elsif rising_edge(clk) then
            -- shift last_bits to the left by one and append new data
            last_bits := last_bits(3 DOWNTO 0) & data;

            if last_bits = "11000" then
                count := count + 1;
            end if;

            count_sig <= count;
            
            if count > 99 then
                -- in function int_to_7_seg it will return - -
                first_digit := -1;
                second_digit := -1;
            else
                first_digit := count mod 10;
                second_digit := (count - first_digit) / 10;
            end if;

            seg1 <= int_to_7_seg(first_digit);
            seg2 <= int_to_7_seg(second_digit);

            -- synchronous actions (sequential)
        end if;
        -- no code here
    END PROCESS;
END behavior;