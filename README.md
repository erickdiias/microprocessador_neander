# TRABALHO DIGITAIS 4B

Este repositório contém os arquivos do projeto de sistemas digitais desenvolvido para o trabalho da disciplina **Sistemas Digitais - 4º B**. O projeto é implementado em **VHDL** e abrange módulos essenciais para o funcionamento de um sistema digital.

## Estrutura do Repositório

### Arquivos Principais

- **bin2bcd.vhd**: Implementa a conversão de valores binários para o formato BCD (Binary-Coded Decimal).
- **clk_div.vhd**: Módulo divisor de clock para ajustar a frequência do sinal de entrada.
- **controlador_7seg.vhd**: Controlador para gerenciar o funcionamento de displays de 7 segmentos.
- **controle.vhd**: Responsável pelo controle e gerenciamento dos sinais e estados do sistema.
- **decod.vhd**: Decodificador utilizado para traduzir sinais ou instruções.
- **MEM.vhd**: Módulo de memória, armazenando dados necessários ao sistema.
- **pc.vhd**: Implementa o contador de programa, essencial para sistemas sequenciais.
- **reg.vhd**: Gerenciamento de registradores utilizados no projeto.
- **tabela.py**: Script Python auxiliar para geração de tabelas ou cálculos necessários ao projeto.
- **TRABALHO_4B.vhd**: Arquivo principal que integra todos os módulos do projeto.

### Pasta de Testes
Inclua detalhes aqui se houver arquivos relacionados a testes ou simulações.

## Requisitos

- Ferramenta de simulação e síntese para VHDL (ModelSim, Quartus, etc.).
- Python 3 (para executar o script `tabela.py`).

## Como Usar

1. Clone o repositório:
   ```bash
   git clone <https://github.com/erickdiias/microprocessador_neander.git>
   ```
2. Importe os arquivos VHDL no ambiente de simulação de sua preferência.
3. Compile e simule os módulos para verificar o funcionamento.
4. Utilize o script Python (`tabela.py`) conforme necessário para auxiliar no desenvolvimento.

## Licença
Este projeto é licenciado sob a [Licença MIT](LICENSE). Sinta-se à vontade para usar, modificar e distribuir este código, desde que sejam mantidos os devidos créditos.

---

Se tiver dúvidas ou sugestões, fique à vontade para abrir uma [issue](https://github.com/) ou entrar em contato. Obrigado por explorar este repositório!

