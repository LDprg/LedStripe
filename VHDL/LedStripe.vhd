library ieee;
use ieee.std_logic_1164.all;

library work;
use work.types.all;

entity LedStripe is
	generic (
		leds_g : natural
	);
	port (
		clk_100M_i : in  std_logic;
		data_i     : in  GRB_vector(leds_g downto 0);
		led_o      : out std_logic
	);
end LedStripe;

architecture rtl of LedStripe is
	signal data_s : LedState := IDLE;
	signal send_s : std_logic := '0';
begin
	inst_LedSequence : entity work.LedSequence
		port map (
			clk_100M_i => clk_100M_i,
			en_i       => send_s,
			data_i     => data_s,
			data_o     => led_o
		);
end rtl;