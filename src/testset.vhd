LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testset IS
  PORT (
    data    : OUT std_logic;
    clock   : OUT std_logic;
    reset   : OUT std_logic := '1'
  );
END testset;

ARCHITECTURE set1 OF testset IS
BEGIN
  PROCESS
  VARIABLE pattern_vector : std_logic_vector(4 DOWNTO 0) := "11000";
  BEGIN
    FOR i IN 1 TO 110 LOOP
      FOR ii in pattern_vector'range loop
        data <= pattern_vector(ii);
        clock <= '0';
        WAIT FOR 20 ns;
        clock <= '1';
        WAIT FOR 20 ns;
      END LOOP;
    END LOOP;

    reset <= '0';
    clock <= '0';
    WAIT FOR 20 ns;
    clock <= '1';
    WAIT FOR 20 ns;
    reset <= '1';

    FOR i IN 1 TO 50 LOOP
    FOR ii in pattern_vector'range loop
        data <= pattern_vector(ii);
        clock <= '0';
        WAIT FOR 20 ns;
        clock <= '1';
        WAIT FOR 20 ns;
      END LOOP;
    END LOOP;

    WAIT; -- forever
  END PROCESS;
END set1;
