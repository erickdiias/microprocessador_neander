library ieee;
use ieee.std_logic_1164.all;

entity controle is
    port(
        clk_1Hz         : in std_logic;  
        reset           : in std_logic;   
        controle_in     : in std_logic_vector(2 downto 0); 
        carrega         : out std_logic; 
        zera            : out std_logic; 
        att             : out std_logic; 
        ler             : out std_logic; 
        opcode          : out std_logic_vector(2 downto 0) 
    );
end entity;

architecture main of controle is

    type estado is (buscar, executar);
    signal estadoAtual, proximoEstado : estado := buscar;

begin
    process(clk_1Hz, reset)
    begin
        if reset = '1' then
            estadoAtual <= buscar;
            zera <= '1';
        elsif rising_edge(clk_1Hz) then
            estadoAtual <= proximoEstado;
            zera <= '0';
        end if;
    end process;


    process(estadoAtual, controle_in)
    begin

        carrega <= '0';
        att     <= '0';
        ler     <= '0';
        opcode <= controle_in;

        case estadoAtual is
            when buscar =>
                ler <= '1';
                proximoEstado <= executar;

            when executar =>
                case controle_in is
                    when "000" =>  -- NOP
                        null; 
                    when "001" =>  -- LDA
                        carrega <= '1';
                        att <= '1';
                    when "010" =>  -- ADD
                        carrega <= '1';
                        att <= '1';
                    when "011" =>  -- SUB
                        carrega <= '1';
                        att <= '1';
                    when "100" =>  -- STA
                        carrega <= '1';
                        att <= '1'; 
                    when "101" =>  -- JMP
                        carrega <= '1';
                        att <= '1'; 
                    when "110" =>  -- HLT
                        ler <= '1';
                    when others =>
                        null; 
                end case; 
                proximoEstado <= buscar;
            when others =>
                proximoEstado <= buscar;
        end case;
    end process;

end architecture;
