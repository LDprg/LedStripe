library ieee;
use ieee.std_logic_1164.all;

entity tb is
end tb;

architecture sim of tb is
	signal clk_50M_s : std_logic := '0';
	signal led_s     : std_logic := '0';

	constant clk_per : time := 20 ns;
begin
	inst_uart_top : entity work.top
		port map (
			clk_50M_i => clk_50M_s,
			led_o     => led_s
		);

	clk_50M_s <= not clk_50M_s after clk_per/2;
end sim;