library ieee;
use ieee.std_logic_1164.all;

entity top is
	port (
		clk_100M_i : in std_logic;
		led_o  : out std_logic
	);
end top;

architecture rtl of top is
begin
--	inst_uart_rx : entity work.uart_rx
--		port map (
--			clk_100M_i => clk_100M_i,
--			uart_rx_i  => uart_rx_i,
--			data_o     => data_rx_s,
--			ready_o    => ready_rx_s
--		);
end rtl;