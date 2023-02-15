library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;

use work.seven_seg.all;

ENTITY disp_drv IS
    PORT (
        bcd : IN integer;
        seg: OUT std_logic_vector(6 downto 0)
    ); 
END disp_drv;

ARCHITECTURE behavior of disp_drv IS
BEGIN
    seg <= int_to_7_seg(bcd);
END behavior;