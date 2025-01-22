
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MEM is
    port(
        clk_1Hz : in  std_logic;
        ler     : in  std_logic;
        mem_in  : in  std_logic_vector(3 downto 0);
        mem_out : out std_logic_vector(15 downto 0)
    );
end MEM;

architecture Behavioral of MEM is
    type memoria_type is array (0 to 15) of std_logic_vector(15 downto 0);
    signal memoria : memoria_type := (
        "0000000100000111", -- ADD X, Y: Adiciona os valores de X e Y e armazena o resultado em X.
        "0000010100000010", -- LOAD Y: Carrega um valor para o registrador Y.
        "0000000100000101", -- ADD X, Y: Soma X e Y.
        "0000000100001000", -- ADD X, 4: Soma o valor constante 4 ao registrador X.
        "0000001000000101", -- AND X, Y: Realiza a operação AND entre X e Y.
        "0000010000000000", -- NOT X: Inverte os bits do valor no registrador X.
        "0000001000001111", -- AND X, Y: Realiza outra operação AND entre X e Y.
        "0000001100000100", -- OR X, Y: Realiza a operação OR entre X e Y.
        "0000010110101010", -- LOAD Y, 10: Carrega o valor 10 no registrador Y.
        "0000000101000100", -- ADD X, 4: Soma 4 ao valor de X.
        "0000000100000001", -- ADD X, 1: Soma 1 ao valor de X.
        "0000000100000001", -- ADD X, 1: Soma 1 ao valor de X.
        "0000010111111111", -- LOAD Y, 255: Carrega 255 no registrador Y.
        "0000000100000001", -- ADD X, Y: Soma X e Y.
        "0000010100001010", -- LOAD Y: Carrega novamente um valor para Y.
        "0000011000000000"  -- HALT: Encerra a execução do programa.
    );
begin

    process(clk_1Hz, ler)
    begin
        if rising_edge(clk_1Hz) then
            if ler = '1' then
                mem_out <= memoria(to_integer(unsigned(mem_in)));
            end if;
        end if;
    end process;

end architecture;