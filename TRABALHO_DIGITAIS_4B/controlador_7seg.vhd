library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity controlador_7seg is
    Port(
        clk : in std_logic;
        digit_0 : in std_logic_vector(3 downto 0);
        digit_1 : in std_logic_vector(3 downto 0);
        digit_2 : in std_logic_vector(3 downto 0);
        digit_3 : in std_logic_vector(3 downto 0);
        AN : out std_logic_vector(3 downto 0);
        display : out std_logic_vector(6 downto 0)
    );
end entity;

architecture Behavioral of controlador_7seg is

signal selected_counter : std_logic_vector(3 downto 0);
signal counter4 : integer range 0 to 3;
signal clk1ms : integer range 0 to 100000;
begin

    process(clk) -- Contador T=1ms
    begin
        if rising_edge(clk) then
            if clk1ms = 100000 then
                clk1ms <= 0;
            else
                clk1ms <= clk1ms + 1;
            end if;
        end if;
    end process;

    process(clk) -- Contador de 0 a 3 de T=4ms
    begin
        if rising_edge(clk) then
            if clk1ms = 0 then
                if counter4 = 3 then
                    counter4 <= 0;
                else
                    counter4 <= counter4 + 1;
                end if;
            end if;
        end if;
    end process;
    
    process(clk)
    begin
        if rising_edge(clk) then
            case counter4 is
                when 0 =>
                    selected_counter <= digit_0;
                    AN <= "1110";
                when 1 =>
                    selected_counter <= digit_1;
                    AN <= "1101";
                when 2 =>
                    selected_counter <= digit_2;
                    AN <= "1011";
                when 3 =>
                    selected_counter <= digit_3;
                    AN <= "0111";
                when others =>
                    selected_counter <= (others => '0');
                    AN <= "0000";
            end case;
        end if;
    end process;

    process(clk)
    begin
        if rising_edge(clk) then 
            case selected_counter is
                when "0000" =>
                    display <= "1000000";  -- Mostrar 0
                when "0001" =>
                    display <= "1111001";  -- Mostrar 1
                when "0010" =>
                    display <= "0100100";  -- Mostrar 2
                when "0011" =>
                    display <= "0110000";  -- Mostrar 3
                when "0100" =>
                    display <= "0011001";  -- Mostrar 4
                when "0101" =>
                    display <= "0010010";  -- Mostrar 5 
                when "0110" =>
                    display <= "0000010";  -- Mostrar 6
                when "0111" =>
                    display <= "1111000";  -- Mostrar 7
                when "1000" =>
                    display <= "0000000";  -- Mostrar 8
                when "1001" =>
                    display <= "0010000";  -- Mostrar 9
                when others =>
                    display <= "1111111";  -- Apagar todos os segmentos
            end case;
        end if;
    end process;
    
end architecture;