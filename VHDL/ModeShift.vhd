library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.types.all;

entity ModeShift is
	generic (
		leds_g : natural
	);
	port (
		clk_50M_i : in  std_logic;
		data_o    : out GRB_vector(leds_c-1 downto 0)
	);
end ModeShift;

architecture rtl of ModeShift is
begin
end rtl;