library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_alu is
end entity tb_alu;

architecture sim of tb_alu is

    signal sel : std_logic_vector(1 downto 0);
    signal a, b : std_logic_vector(3 downto 0);
    signal out  : std_logic_vector(4 downto 0);

begin

    -- Instantiate DUT
    uut: entity work.alu
        port map (
            sel => sel,
            a   => a,
            b   => b,
            out => out
        );

    stimulus: process
    begin

        -- Test 1: sel = 00 → a + b
        sel <= "00"; a <= "0101"; b <= "0011"; wait for 10 ns;

        -- Test 2: sel = 01 → a - b
        sel <= "01"; a <= "0111"; b <= "0010"; wait for 10 ns;

        -- Test 3: sel = 10 → a & b
        sel <= "10"; a <= "1101"; b <= "1011"; wait for 10 ns;

        -- Test 4: sel = 11 → a | b
        sel <= "11"; a <= "1100"; b <= "0011"; wait for 10 ns;

        -- Test 5: default branch (others)
        sel <= "XX"; a <= "0000"; b <= "0000"; wait for 10 ns;

        wait;
    end process;

end architecture sim;
