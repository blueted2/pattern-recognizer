library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY counter IS
    PORT (
        match, reset, clk : IN std_logic;
        bcd1, bcd2 : OUT integer RANGE 0 to 11 
    ); 
END counter;

ARCHITECTURE behavior of counter IS
BEGIN
    PROCESS(clk, reset)
        VARIABLE count : integer RANGE 0 to 101 := 0;
        -- <your declarations>
        BEGIN
        if reset = '0' then
            count := 0;
        elsif rising_edge(clk) then
            -- shift last_bits to the left by one and append new data
            if match = '1' then
                count := count + 1;
            end if;

            if count > 99 then
                -- in function int_to_7_seg it will return - -
                bcd1 <= 10;
                bcd2 <= 10;
                
                count := 100;
            else
                bcd1 <= count mod 10;
                bcd2 <= (count - (count mod 10)) / 10;
            end if;

        end if;
        -- no code here
    END PROCESS;
END behavior;