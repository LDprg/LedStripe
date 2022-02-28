library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.types.all;

entity Prescaler is
	port (
		clk_50M_i : in  std_logic;
		en_1_o    : out std_logic;
		en_10_o   : out std_logic
	);
end Prescaler;

architecture rtl of Prescaler is
	signal count_1_s  : unsigned(27 downto 0) := (others => '0');
	signal count_10_s : unsigned(27 downto 0) := (others => '0');
begin
	p_clk_1 : process (clk_50M_i)
	begin
		if (rising_edge(clk_50M_i)) then
			count_1_s <= count_1_s + 1;
			if (count_1_s = 50000000) then
				en_1_o <= '1';
				count_1_s <= (others => '0');
			else
				en_1_o <= '0';
			end if;
		end if;
	end process p_clk_1;

	p_clk_10 : process (clk_50M_i)
	begin
		if (rising_edge(clk_50M_i)) then
			count_10_s <= count_10_s + 1;
			if (count_10_s = 5000000) then
				en_10_o <= '1';
				count_10_s <= (others => '0');
			else
				en_10_o <= '0';
			end if;
		end if;
	end process p_clk_10;
end rtl;