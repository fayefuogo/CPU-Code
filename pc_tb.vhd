library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  

entity pc_tb is
end entity;



architecture behavior of pc_tb is

component pc is
port(
        clk, rst, en, ld: in std_logic;
        input: in std_logic_vector(3 downto 0);
        output: out std_logic_vector(3 downto 0)
);
end component;

	signal clk_sig: std_logic;
	signal rst_sig: std_logic;
	signal en_sig: std_logic;
	signal ld_sig: std_logic;
	signal input_sig: std_logic_vector(3 downto 0);
	signal output_sig: std_logic_vector(3 downto 0);

	constant clk_period : time:= 10 ns;

begin
  pc1: pc port map(clk => clk_sig, rst => rst_sig, en => en_sig, ld => ld_sig, input => input_sig, output => output_sig);
  
process
begin
  clk_sig <= '0';
  wait for clk_period/2;
  clk_sig <= not clk_sig;
  wait for clk_period/2;
end process;

process
begin
rst_sig<='0';
en_sig<='0';
ld_sig<='0';

wait for clk_period*5;
en_sig<='1';
wait for clk_period*5;
en_sig<='0';
rst_sig<='1';
wait for clk_period;
en_sig<='1';
rst_sig<='0';
wait;

end process;
end behavior;

