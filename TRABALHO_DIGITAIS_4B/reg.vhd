--  File: REG.vhd
--  Descrição: Este arquivo contém o código VHDL para um registrador de 8 bits.
--  Autor: Erick S. Dias
--  Ultima atualização: 04/01/2025

library ieee;
use ieee.std_logic_1164.all;

entity reg is
    port(
        clk_1Hz  : in std_logic;
        reset    : in std_logic;
        carrega  : in std_logic;
        reg_in   : in std_logic_vector(7 downto 0);
        reg_out  : out std_logic_vector(7 downto 0)
    );
end entity;

architecture main of reg is
    signal reg : std_logic_vector(7 downto 0);
begin
    process (clk_1Hz, reset, carrega)
    begin
        if reset = '1' then
            reg <= (others => '0');
        elsif rising_edge(clk_1Hz) then
            if carrega = '1' then
                reg <= reg_in;
            end if;
        end if;
    end process;
    
    reg_out <= reg;

end architecture;
