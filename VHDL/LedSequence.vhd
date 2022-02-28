library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.types.all;

entity LedSequence is
	port (
		clk_50M_i : in  std_logic;
		en_i       : in  std_logic;
		data_i     : in  LedState;
		idle_o     : out std_logic;
		data_o     : out std_logic
	);
end LedSequence;

architecture rtl of LedSequence is
	signal state_s   : LedState  := IDLE;
	signal state_h_s   : std_logic  := '0';

	signal timer_en_s : std_logic := '0';
	signal data_s : std_logic := '0';

	signal count_s : unsigned(12 downto 0) := (others => '0');
begin
	p_clk : process (clk_50M_i)
	begin
		if (rising_edge(clk_50M_i) and en_i = '1') then
			if (timer_en_s = '1') then
				count_s <= count_s + 1;
			else
				count_s <= (others => '0');
			end if;
		end if;
	end process p_clk;

	p_state : process (en_i, clk_50M_i)
	begin
		if (rising_edge(clk_50M_i)) then
			case(state_s) is
				when '1' =>
					timer_en_s <= '1';

					if(state_h_s = '1') then
						data_s  <= '1';
						if (count_s = 45) then
							timer_en_s <= '0';
							state_h_s <= '0';
						end if;
					else
						data_s  <= '0';
						if (count_s = 18) then
							timer_en_s <= '0';
							state_s    <= IDLE;
						end if;
					end if;

				when '0' =>
					timer_en_s <= '1';

					if(state_h_s = '1') then
						data_s  <= '1';
						if (count_s = 18) then
							timer_en_s <= '0';
							state_h_s <= '0';
						end if;
					else
						data_s  <= '0';
						if (count_s = 45) then
							timer_en_s <= '0';
							state_s    <= IDLE;
						end if;
					end if;

				when RET =>
					timer_en_s <= '1';
					data_s     <= '0';

					if (count_s = 5000) then
						timer_en_s <= '0';
						state_s    <= IDLE;						
					end if;

				when IDLE =>
					timer_en_s <= '0';
					state_h_s <= '1';

					if (en_i = '1') then
						state_s <= data_i;
					end if;
			end case;
		end if;
	end process p_state;

	idle_o <= '1' when state_s = IDLE else '0';

	data_o <= data_s;
end rtl;