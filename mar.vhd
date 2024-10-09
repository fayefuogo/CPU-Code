library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mar is
	port(
      		clk,rst,load: in std_logic;
      		input: in std_logic_vector(3 downto 0);
      		output: out std_logic_vector(3 downto 0)
      		
	);
end entity;

architecture behavior of mar is
	signal stored_value: std_logic_vector(3 downto 0) := (others=>'Z');

begin
  
  	process(clk,rst)
  	begin
      	if rst = '1' then
        	stored_value<=(others=>'Z');
      	elsif rising_edge(clk) then
      		if load = '1' then
          		stored_value <= input;
    	end if;
	  	end if;
    	end process;
	
	output<= stored_value;
end behavior;