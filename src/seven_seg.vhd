library ieee;
use ieee.std_logic_1164.all;

package seven_seg is

    function int_to_7_seg(val : integer RANGE 0 to 11) return std_logic_vector;

end package seven_seg;

package body seven_seg is

    function int_to_7_seg(val : integer RANGE 0 to 11) return std_logic_vector IS 
    BEGIN
        case val is --             GFEDCBA
            when 0      => return "1000000";
            when 1      => return "1111001";
            when 2      => return "0100100";
            when 3      => return "0110000";
            when 4      => return "0011001";
            when 5      => return "0010010";
            when 6      => return "0000010";
            when 7      => return "1111000";
            when 8      => return "0000000";
            when 9      => return "0010000";
            when others => return "0111111"; -- "-" 
        END case;
    END function;

end package body seven_seg;