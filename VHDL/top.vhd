library ieee;
use ieee.std_logic_1164.all;

library work;
use work.types.all;

entity top is
	generic (
		leds_g : natural := 300
	);
	port (
		clk_100M_i : in  std_logic;
		led_o      : out std_logic
	);
end top;

architecture rtl of top is
	signal data_s : GRB_vector(leds_g downto 0);
begin
	inst_LedStripe : entity work.LedStripe
		generic map (
			leds_g => leds_g
		)
		port map (
			clk_100M_i => clk_100M_i,
			data_i     => data_s,
			led_o      => led_o
		);
end rtl;