library ieee;
use ieee.std_logic_1164.all;

library work;
use work.types.all;

entity top is
	port (
		clk_50M_i : in  std_logic;
		led_o     : out std_logic
	);
end top;

architecture rtl of top is
	constant leds_c : natural                       := 60;
	signal data_s   : RGB_vector(leds_c-1 downto 0);
begin
	inst_LedStripe : entity work.LedStripe
		generic map (
			leds_g => leds_c
		)
		port map (
			clk_50M_i => clk_50M_i,
			data_i    => data_s,
			led_o     => led_o
		);

	inst_ModeShift : entity work.ModeShift
		generic map (
			leds_g => leds_c
		)
		port map (
			clk_50M_i => clk_50M_i,
			data_o    => data_s
		);
end rtl;