library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY list_det IS
    PORT (
        data, reset, clk : IN std_logic;
        match : OUT std_logic
    ); 
END list_det;

ARCHITECTURE behavior of list_det IS
BEGIN
    PROCESS(clk, reset)
        VARIABLE last_bits : std_logic_vector(4 DOWNTO 0);
        -- <your declarations>
        BEGIN
        if reset = '0' then
            last_bits := "00000";
            match <= '0';
        elsif rising_edge(clk) then
            -- shift last_bits to the left by one and append new data
            last_bits := last_bits(3 DOWNTO 0) & data;

            if last_bits = "11000" then
                match <= '1';
            else
                match <= '0';
            end if;
        end if;
        -- no code here
    END PROCESS;
END behavior;