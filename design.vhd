library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
    port (
        sel : in  std_logic_vector(1 downto 0);
        a   : in  std_logic_vector(3 downto 0);
        b   : in  std_logic_vector(3 downto 0);
        out : out std_logic_vector(4 downto 0)
    );
end entity alu;

architecture behavioral of alu is
begin
    process(sel, a, b)
    begin
        case sel is
            when "00" =>
                out <= std_logic_vector(unsigned(a) + unsigned(b));   -- Branch 1
            when "01" =>
                out <= std_logic_vector(unsigned(a) - unsigned(b));   -- Branch 2
            when "10" =>
                out <= std_logic_vector(unsigned(a) and unsigned(b)); -- Branch 3
            when "11" =>
                out <= std_logic_vector(unsigned(a) or  unsigned(b)); -- Branch 4
            when others =>
                out <= (others => '0');                               -- Branch 5 (default)
        end case;
    end process;
end architecture behavioral;
