library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity control_unit is

	port(
		clk,rst: in std_logic;
		inst: in std_logic_vector(3 downto 0);
		do: out std_logic_vector(16 downto 0)
	);

end entity;

architecture behavior of control_unit is

	signal counter: std_logic_vector(3 downto 0):= "0000";

begin

	count_proc: process(clk,rst)
	begin
		if rst = '1' then
			counter <= "0000";
		elsif rising_edge(clk) then
			if (counter = "1010") then
				counter <= "0000";
			else
				counter <= std_logic_vector(unsigned(counter+1));
			end if;
		end if;

	end process;

	
--HLT--OUT_IN--OUT_OUT--ALU_OP_EN--ALU_EN--PC_EN--PC_IN--PC_OUT-MAR_IN--RAM_IN--RAM_OUT--A_IN--A_OUT--B_IN--B_OUT--INST_I--INST_OUT
--16 --15 -----14--------13--------12------11------10-----9-----8---------7-------6-------5-----4------3------2------1--------0
do <= "00000001100000000" when counter = "0000" else
      "00000001100000000" when counter = "0001" else 
      "00000100001000010" when counter = "0010" else
      "00000000001000010" when counter = "0011" else

      --LDA
      "00000000000000001" when (counter = "0100" and inst="0000") else
      "00000000100000001" when (counter = "0101" and inst="0000") else
      "00000000001100000" when (counter = "0110" and inst="0000") else
      "00000000001100000" when (counter = "0111" and inst="0000") else
      "00000000000000000" when (counter = "1000" and inst="0000") else
      "00000000000000000" when (counter = "1001" and inst="0000") else
      "00000000000000000" when (counter = "1010" and inst="0000") else

      "00000000000000001" when (counter="0100" and inst="0001") else	--INST_REG-> main_bus
      "00000000100000001" when (counter="0101" and inst="0001") else
      "00000000010010000" when (counter="0110" and inst="0001") else    
      "00000000010010000" when (counter="0111" and inst="0001") else    
      "00000000000000000" when (counter="1000" and inst="0001") else
      "00000000000000000" when (counter="1001" and inst="0001") else
      "00000000000000000" when (counter="1010" and inst="0001") else

      --ADD
      "00000000000000001" when (counter="0100" and inst="0010") else    
      "00000000100000001" when (counter="0101" and inst="0010") else
      "00000000001001000" when (counter="0110" and inst="0010") else    
      "00000000001001000" when (counter="0111" and inst="0010") else    
      "00001000000000000" when (counter="1000" and inst="0010") else
      "00001000000100000" when (counter="1001" and inst="0010") else
      "00000000000000000" when (counter="1010" and inst="0010") else

      --SUB
      "00000000000000001" when (counter="0100" and inst="0011") else    
      "00000000100000001" when (counter="0101" and inst="0011") else
      "00000000001001000" when (counter="0110" and inst="0011") else    
      "00000000001001000" when (counter="0111" and inst="0011") else    
      "00010000000000000" when (counter="1000" and inst="0011") else
      "00011000000100000" when (counter="1001" and inst="0011") else
      "00000000000000000" when (counter="1010" and inst="0011") else

      --JMP
      "00000000000000001" when (counter="0100" and inst="0100") else    
      "00000010000000001" when (counter="0101" and inst="0100") else
      "00000000000000000" when (counter="0110" and inst="0100") else    
      "00000000000000000" when (counter="0111" and inst="0100") else    
      "00000000000000000" when (counter="1000" and inst="0100") else
      "00000000000000000" when (counter="1001" and inst="0100") else
      "00000000000000000" when (counter="1010" and inst="0100") else
      --OUT
      "00000000000000001" when (counter="0100" and inst="0101") else    
      "00000000100000001" when (counter="0101" and inst="0101") else
      "00000000001000000" when (counter="0110" and inst="0101") else
      "01000000001000000" when (counter="0111" and inst="0101") else
      "00100000000000000" when (counter="1000" and inst="0101") else
      "00100000000000000" when (counter="1001" and inst="0101") else
      "00000000000000000" when (counter="1010" and inst="0101") else
      --HLT
      "10000000000000000" when (counter="0100" and inst="0110") else    
      "10000010000000000" when (counter="0101" and inst="0110") else
      "00000000000000000" when (counter="0110" and inst="0110") else    
      "00000000000000000" when (counter="0111" and inst="0110") else    
      "00000000000000000" when (counter="1000" and inst="0110") else
      "00000000000000000" when (counter="1001" and inst="0110") else
      "00000000000000000" when (counter="1010" and inst="0110")     ;

end behavior;