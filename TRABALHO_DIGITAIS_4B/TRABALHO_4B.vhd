

library ieee;
use ieee.std_logic_1164.all;

entity TRABALHO_4B is
    Port (
        clk : in std_logic;
        reset : in std_logic;
        controle_bcd : out std_logic_vector(3 downto 0);
        saida_bcd : out std_logic_vector(6 downto 0)
    );
end entity;

architecture main of TRABALHO_4B is

    -- sinal da instância do CLK_div
    signal clk_1Hz : std_logic;
    
    -- sinal da instância do PC
    signal pc_out : std_logic_vector(3 downto 0);

    -- Sinal da instância do MEM
    signal mem_out : std_logic_vector(15 downto 0);

    -- sinal da insância do decod
    signal decod_out : std_logic_vector(2 downto 0);

    -- sinal da instância do controle
    signal carrega : std_logic;
    signal zera : std_logic;
    signal att : std_logic;
    signal ler : std_logic;
    signal opcode : std_logic_vector(2 downto 0);

    signal resultado_ula : std_logic_vector(7 downto 0);

    signal reg_out : std_logic_vector(7 downto 0);

    signal bcd0 : std_logic_vector(3 downto 0);
    signal bcd1 : std_logic_vector(3 downto 0);
    signal bcd2 : std_logic_vector(3 downto 0);
    signal bcd3 : std_logic_vector(3 downto 0);
    
begin

    -- Instância do CLK_div
    CLK_div_inst : entity work.CLK_div
        generic map(
            freq_clk => 100e6 -- freq_boolean 100MHz
        )
        port map(
            clk => clk,
            clk_1Hz => clk_1Hz
        );
    
    -- Instância do PC
    PC_inst : entity work.PC
        port map(
            clk_1Hz => clk_1Hz,
            zera => zera,
            att => att,
            pc_out => pc_out
        );

    -- Instância do MEM
    MEM_inst : entity work.MEM
        port map(
            clk_1Hz => clk_1Hz,
            ler => ler,
            mem_in  => pc_out,
            mem_out => mem_out
        );
    
    ula_inst: entity work.ula
        port map(
            X => reg_out,           
            Y => mem_out(7 downto 0),       
            sel => opcode,         
            resultado => resultado_ula
        );

    reg_inst: entity work.reg
        port map(
            clk_1Hz => clk_1Hz,
            reset => reset, 
            carrega => carrega,   
            reg_in => resultado_ula,   
            reg_out => reg_out
        );

    -- Instância do decod
    decod_inst: entity work.decod
        port map(
            decod_in => mem_out(15 downto 8),
            decod_out => decod_out
        );

    -- Instância do controle
    controle_inst: entity work.controle
        port map(
            clk_1Hz => clk_1Hz,
            reset => reset,
            controle_in => decod_out,
            carrega => carrega,
            zera => zera,
            att => att,
            ler => ler,
            opcode => opcode
        );

    bin2bcd_inst: entity work.bin2bcd
        port map(
            bin_in => reg_out,
            bcd0 => bcd0,
            bcd1 => bcd1,
            bcd2 => bcd2,
            bcd3 => bcd3
        );

    controlador_7seg_inst: entity work.controlador_7seg
        port map(
            clk => clk,
            digit_0 => bcd0,
            digit_1 => bcd1,
            digit_2 => bcd2,
            digit_3 => bcd3,
            AN => controle_bcd,
            display => saida_bcd
        );

end architecture;