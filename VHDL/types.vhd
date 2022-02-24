library ieee;
use ieee.std_logic_1164.all;

package types is
	subtype GRB is std_logic_vector(23 downto 0); 
	type GRB_vector is Array(natural range <>) of GRB;

	type LedState is ('0', '1', RET, IDLE);
end package types;

package body types is

end package body types;