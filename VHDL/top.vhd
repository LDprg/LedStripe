library ieee;
use ieee.std_logic_1164.all;

library work;
use work.types.all;

entity top is
	port (
		clk_100M_i : in  std_logic;
		led_o      : out std_logic
	);
end top;

architecture rtl of top is
	constant leds_c : natural := 10;
	signal data_s : GRB_vector(leds_c-1 downto 0) := (1 => (others => '1'),others => (others => '0'));
begin
	inst_LedStripe : entity work.LedStripe
		generic map (
			leds_g => leds_c
		)
		port map (
			clk_100M_i => clk_100M_i,
			data_i     => data_s,
			led_o      => led_o
		);
end rtl;