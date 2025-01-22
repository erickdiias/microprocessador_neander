
library ieee;
use ieee.std_logic_1164.all;

entity decod is
    port(
        decod_in : in std_logic_vector(7 downto 0);
        decod_out : out std_logic_vector(2 downto 0)
    );
end entity;

architecture main of decod is
begin
    decod_out <= decod_in(2 downto 0);
end architecture;
