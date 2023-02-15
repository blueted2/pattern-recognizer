library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY disp_drv IS
    PORT (
        bcd : IN integer;
        seg: OUT std_logic_vector(6 downto 0)
    ); 
END disp_drv;

ARCHITECTURE behavior of disp_drv IS
BEGIN
    PROCESS(bcd)
        -- <your declarations>
        BEGIN
        case bcd is 
            when 0 => seg <= "1111110";
            when 1 => seg <= "0110000";
            when 2 => seg <= "1101101";
            when 3 => seg <= "1111001";
            when 4 => seg <= "0110011";
            when 5 => seg <= "1011011";
            when 6 => seg <= "1011111";
            when 7 => seg <= "1110000";
            when 8 => seg <= "1111110";
            when 9 => seg <= "1111011";
            when others => seg <= "0000001";
        END case;
    END PROCESS;
END behavior;