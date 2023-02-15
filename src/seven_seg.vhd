library ieee;
use ieee.std_logic_1164.all;

package seven_seg is

    function int_to_7_seg(val : integer RANGE 0 to 11) return std_logic_vector;

end package seven_seg;

package body seven_seg is

    function int_to_7_seg(val : integer RANGE 0 to 11) return std_logic_vector IS 
    BEGIN
        case val is 
            when 0      => return "0000001";
            when 1      => return "1001111";
            when 2      => return "0010010";
            when 3      => return "0000110";
            when 4      => return "1001100";
            when 5      => return "0100100";
            when 6      => return "0100000";
            when 7      => return "0001111";
            when 8      => return "0000001";
            when 9      => return "0000100";
            when others => return "1111110";
        END case;
    END function;

end package body seven_seg;