
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clk_div is
    generic(
        freq_clk : integer
    );
    port(
        clk : in std_logic;
        clk_1Hz : out std_logic
    );
end entity;

architecture rtl of clk_div is
    signal contagem : integer := 0;
    signal clk_1Hz_int : std_logic := '0';
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if contagem = freq_clk / 2 then
                contagem <= 0;
                clk_1Hz_int <= not clk_1Hz_int;
            else
                contagem <= contagem + 1;
            end if;
        end if;
    end process;

    clk_1Hz <= clk_1Hz_int;

end architecture;