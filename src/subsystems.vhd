LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
-- comment
ENTITY pattern_recognizer IS
    PORT (
        data, reset, clk : IN std_logic;
        seg1, seg2 : OUT std_logic_vector(6 downto 0)
    ); 
END pattern_recognizer;

ARCHITECTURE subsystems OF pattern_recognizer IS

  COMPONENT list_det is
    PORT (
      data, reset, clk : IN std_logic;
      match : OUT std_logic
    ); 
  END COMPONENT;

  COMPONENT counter is
    PORT (
      match, reset, clk : IN std_logic;
      bcd1, bcd2 : OUT integer
    ); 
  END COMPONENT;
  
  COMPONENT disp_drv is 
    PORT (
      bcd : IN integer;
      seg: OUT std_logic_vector(6 downto 0)
    ); 
  END COMPONENT;

  -- local connections
  SIGNAL match_s : std_logic;
  SIGNAL output_seg1, output_seg2  : std_logic_vector(6 downto 0);
  SIGNAL bcd1_s, bcd2_s : integer;
  BEGIN
   ld : list_det
        PORT MAP ( data => data,
                   clk => clk,
                   reset => reset,
                   match => match_s
                   );
   c : counter
        PORT MAP ( match => match_s,
                   clk => clk,
                   reset => reset,
                   bcd1 => bcd1_s,
                   bcd2 => bcd2_s);
   disp_drv1 : disp_drv
        PORT MAP ( bcd => bcd1_s,
                   seg => seg1
                   );
   disp_drv2 : disp_drv
        PORT MAP ( bcd => bcd2_s,
                   seg => seg2
                   );
END subsystems;