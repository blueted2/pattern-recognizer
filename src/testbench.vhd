LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE structure OF testbench IS

  COMPONENT testset
    PORT (data, clock, reset  : OUT  std_logic);
  END COMPONENT;

  COMPONENT pattern_recognizer
    PORT (
        data, reset, clk : IN std_logic;
        seg1, seg2 : OUT std_logic_vector(6 downto 0)
    ); 
  END COMPONENT;

-- local connections
 SIGNAL data_ts, clock_ts, reset_ts : std_logic;
 SIGNAL output_seg1, output_seg2  : std_logic_vector(6 downto 0);
BEGIN
 ts : testset 
      PORT MAP ( data => data_ts,
                 clock => clock_ts,
                 reset => reset_ts);
 dut : pattern_recognizer
      PORT MAP ( data => data_ts,
                 clk => clock_ts,
                 reset => reset_ts,
                 seg1 => output_seg1,
                 seg2 => output_seg2);
END structure;
