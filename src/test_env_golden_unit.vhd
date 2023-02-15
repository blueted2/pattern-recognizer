LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use work.all;
ENTITY test_env_golden_unit IS
END test_env_golden_unit;

architecture compare_with_golden_unit of test_env_golden_unit is

    component pattern_recognizer IS
        PORT (
            data, reset, clk : IN std_logic;
            seg1, seg2 : OUT std_logic_vector(6 downto 0)
        ); 
    end component;

    component compare IS
        PORT (
            reset, clk : IN std_logic;
            seg1_b, seg2_b, seg1_s, seg2_s : IN std_logic_vector(6 downto 0)
        ); 
    end component;

    component testset IS
        PORT (
            data    : OUT std_logic;
            clock   : OUT std_logic;
            reset   : OUT std_logic := '1'
        );
    end component;

    signal data_env, reset_env, clk_env : std_logic;
    signal seg1_s_env, seg2_s_env, seg1_b_env, seg2_b_env : std_logic_vector(6 downto 0);

begin
    b : pattern_recognizer  PORT MAP(data_env, reset_env, clk_env, seg1_b_env, seg2_b_env);
    s : pattern_recognizer  PORT MAP(data_env, reset_env, clk_env, seg1_s_env, seg2_s_env);
    tb : testset PORT MAP(data_env, clk_env, reset_env);
    c : compare PORT MAP (reset_env, clk_env, seg1_b_env, seg2_b_env, seg1_s_env, seg2_s_env);
end compare_with_golden_unit;

configuration components of test_env_golden_unit is
    for compare_with_golden_unit
        FOR b : pattern_recognizer   
            USE ENTITY work.pattern_recognizer(behavior);
        end for;
        FOR s : pattern_recognizer   
            USE ENTITY work.pattern_recognizer(subsystems);
        end for;
    end for;
end components;

