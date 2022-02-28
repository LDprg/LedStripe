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
		data_o    : out GRB_vector(leds_g-1 downto 0)
	);
end ModeShift;

architecture rtl of ModeShift is
	signal data_s : GRB_vector(leds_g-1 downto 0) := (0 => (others => '1'),others => (others => '0'));

	signal en_1_s : std_logic;
begin
	inst_Prescaler : entity work.Prescaler
		port map (
			clk_50M_i => clk_50M_i,
			en_1_o    => en_1_s,
			en_10_o   => open
		);

	p_clk : process (clk_50M_i)
	begin
		if (rising_edge(clk_50M_i)) then
			if (en_1_s = '1') then
				data_s <= data_s(leds_g) & data_s(leds_g-2 downto 0);
			end if;
		end if;
	end process p_clk;

	data_o <= data_s;
end rtl;