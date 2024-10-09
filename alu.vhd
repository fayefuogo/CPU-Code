library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity alu is
	port(
		en, op: in std_logic;
		reg_a_in, reg_b_in: in std_logic_vector(7 downto 0);
		carry_out: out std_logic;
		zero_flag: out std_logic;
		res_out: out std_logic_vector(7 downto 0)
);
end entity;

architecture behavior of alu is

	signal result: std_logic_vector(8 downto 0);
begin

process(reg_a_in, reg_b_in, op)
begin
	if op = '0' then
		result <= ext(reg_a_in, 9) + ext(reg_b_in, 9);
	elsif op = '1' then
		result <= ext(reg_a_in, 9) - ext(reg_b_in, 9);
	end if;
end process;

carry_out <= result(8);
zero_flag <= '1' when result(7 downto 0) = "00000000";
res_out <= result(7 downto 0) when en = '1' else (others => 'Z');

end behavior;