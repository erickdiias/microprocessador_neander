
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PC is
    port (
        clk_1Hz : in  std_logic;
        zera   : in  std_logic;
        att     : in  std_logic;
        pc_out  : out std_logic_vector(3 downto 0) 
    );
end entity;

architecture main of PC is

    signal pc : unsigned(3 downto 0) := (others => '0');        

begin
    process(clk_1Hz, zera, att)
    begin
        if zera = '1' then
            pc <= (others => '0');
        elsif rising_edge(clk_1Hz) then
            if att = '1' then
                pc <= pc + 1;
            end if;
        end if;
    end process;

    pc_out <= std_logic_vector(pc);

end architecture;
