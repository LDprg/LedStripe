library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package types is
	subtype RGB is std_logic_vector(23 downto 0);
	type RGB_vector is Array(natural range <>) of RGB;

	constant WHITE_RGB : RGB := (others => '1');
	constant BLACK_RGB : RGB := (others => '0');

	constant RED_RGB : RGB := x"FF0000";	
	constant GREEN_RGB : RGB := x"00FF00";
	constant BLUE_RGB : RGB := x"0000FF";	

	type LedState is ('0', '1', RET, IDLE);

	function f_log2 (x : positive) return natural;

	function to_LedState (x : std_logic) return LedState;
end package types;

package body types is

	function f_log2 (x : positive) return natural is
		variable i         : natural;
	begin
		i := 0;
		while (2**i < x) and i < 31 loop
			i := i + 1;
		end loop;
		return i;
	end function;

	function to_LedState (x : std_logic) return LedState is
	begin
		case(x) is
			when '1' =>
				return '1';
			when '0' =>
				return '0';
			when others =>
				return IDLE;
		end case;
	end function;

end package body types;