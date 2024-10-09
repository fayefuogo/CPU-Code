library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity control_unit_tb is

end entity;


architecture behavior of control_unit_tb is

	component control_unit is
		port(
		clk,rst: in std_logic;
		inst: in std_logic_vector(3 downto 0);
		do: out std_logic_vector(16 downto 0)
	);
	end component;

	signal clk_sig: std_logic:='0';
	signal rst_sig: std_logic;
	signal inst_sig: std_logic_vector(3 downto 0):= "0000";
	signal do_sig: std_logic_vector(16 downto 0);

	signal clk_period: time:=10 ns;
	
	signal pc_out: std_logic;
	signal mar_in: std_logic;
begin
	control_unit_1: control_unit port map(clk => clk_sig, rst => rst_sig, inst => inst_sig, do => do_sig);
	pc_out <= do_sig(9);
	mar_in <= do_sig(8);

	process
	begin
		clk_sig <= '0';
		wait for clk_period/2;
  		clk_sig <= not clk_sig;
  		wait for clk_period/2;
	end process;

	
	process
	begin
		rst_sig <= '1';
		wait for clk_period * 5;
		rst_sig <= '0';
		wait;
		
	end process;

	
end behavior;