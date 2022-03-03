library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.types.all;

entity LedStripe is
	generic (
		leds_g : natural
	);
	port (
		clk_50M_i : in  std_logic;
		data_i    : in  RGB_vector(leds_g-1 downto 0);
		led_o     : out std_logic
	);
end LedStripe;

architecture rtl of LedStripe is
	signal data_s : RGB_vector(leds_g-1 downto 0);

	signal send_s  : LedState  := IDLE;
	signal ready_s : std_logic := '0';

	signal count_led_s : unsigned(f_log2(leds_g) downto 0) := (others => '0');
	signal count_s     : unsigned(5 downto 0)              := (others => '0');
begin
	inst_LedSequence : entity work.LedSequence
		port map (
			clk_50M_i => clk_50M_i,
			en_i      => '1',
			data_i    => send_s,
			idle_o    => ready_s,
			data_o    => led_o
		);

	-- Convert From RGB to GRB
	gen_rgb : for i in 0 to leds_g-1 generate
		data_s(i)(23 downto 16) <= data_i(i)(15 downto 8);
		data_s(i)(15 downto 8) <= data_i(i)(23 downto 16);
		data_s(i)(7 downto 0) <= data_i(i)(7 downto 0);
	end generate gen_rgb;

	p_state : process (clk_50M_i)
	begin
		if (rising_edge(clk_50M_i)) then
			if (ready_s = '1') then
				if (count_s = 23) then
					count_s     <= (others => '0');
					count_led_s <= count_led_s + 1;
				else
					count_s <= count_s + 1;
				end if;

				if (count_led_s = leds_g) then
					count_led_s <= (others => '0');
					count_s     <= (others => '0');
				end if;
			end if;
		end if;
	end process p_state;

	send_s <= RET when count_led_s = leds_g else to_LedState(data_s(to_integer(count_led_s))(23 - to_integer(count_s)));
end rtl;