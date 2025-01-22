
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ula is
    Port (
        X           : in std_logic_vector(7 downto 0); 
        Y           : in std_logic_vector(7 downto 0); 
        sel         : in std_logic_vector(2 downto 0);
        resultado   : out std_logic_vector(7 downto 0)
    );
end entity;

architecture main of ula is
    signal resultado_ula : std_logic_vector(7 downto 0);
begin
    process (sel, X, Y)
    begin
        case sel is
            when "001" => -- Soma
                resultado_ula <= std_logic_vector(unsigned(X) + unsigned(Y));
            when "010" => -- AND
                resultado_ula <= X and Y;
            when "011" => -- OR
                resultado_ula <= X or Y;
            when "100" => -- NOT X
                resultado_ula <= not X;
            when "101" => -- Y
                resultado_ula <= Y;
            when "110" => -- HALT (Parar)
                resultado_ula <= (others => '0');
            when others => 
                resultado_ula <= (others => '0'); 
        end case;
    end process;
    resultado <= resultado_ula;
end architecture;
