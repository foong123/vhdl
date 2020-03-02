library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bcd is

	Port( number   : in  std_logic_vector (7 downto 0);
			converted_number : out std_logic_vector (15 downto 0)
		);
end bcd;

architecture Behavioral of bcd is

signal tens,ones,tensth,onesth : std_logic_vector (3 downto 0);

-- for testing
--signal i_tens,i_ones,i_tensth,i_onesth: std_logic_vector (3 downto 0);
signal i_converted_number : std_logic_vector (15 downto 0);
--signal i_test : std_logic_vector (1 downto 0);

begin

process (number)
	
	-- Internal variable for storing bits (array length + (4 * number of place value))
	variable shift : unsigned(23 downto 0);
	
  -- Alias for parts of shift register
	alias num is shift(7 downto 0);
	alias tenth is shift(11 downto 8);
	alias oneth is shift(15 downto 12);
	alias one is shift(19 downto 16);
	alias ten is shift(23 downto 20);
--	alias hun is shift(27 downto 24);
--	alias tho is shift(31 downto 28);
	
   begin
	
	-- Clear previous number and store new number in shift register
	num := unsigned(number);
	oneth := X"0";
	tenth := X"0";
	one := X"0";
	ten := X"0";
--	hun := X"0";
--	tho := X"0";
	
	-- Loop
	for i in 1 to num'Length loop
	
		-- Check if any digit is greater than or equal to 5
		if tenth >= 1 then
			tenth := tenth + 7;
		end if;
		
		if oneth >= 1 then
			oneth := oneth + 7;
		end if;
		
		if one >= 5 then
			one := one + 3;
		end if;
		
		if ten >= 5 then
			ten := ten + 3;
		end if;
		
--		if hun >= 5 then
--			hun := hun + 3;
--		end if;
--		
--		if tho >= 5 then
--			tho := tho + 3;
--		end if;
		
		-- Shift entire register left once
		shift := shift_left(shift, 1);
		
	end loop;
	
	-- Push decimal numbers to internal signal
--	thousands <= std_logic_vector(tho);
--	hundreds  <= std_logic_vector(hun);
	tens      <= std_logic_vector(ten);
	ones      <= std_logic_vector(one);
	onesth    <= std_logic_vector(oneth);
	tensth    <= std_logic_vector(tenth);
	
	-- create an unqiue identifier to differentiate between decimal points and integer

	onesth(3 downto 2)	<= "11";
	tensth(3 downto 2)	<= "11";
	
	-- rearrange oneth so that it become 0 -> 2 -> 5 -> 7 -> 0 repeat..
	onesth(1 downto 0) 	<= tenth(8) & oneth (12);
	
   end process;
	
	-- Push decimal numbers to output
	converted_number <= tens & ones & onesth & tensth;
	
	-- for verification
	i_converted_number <= tens & ones & onesth & tensth;
--	i_tensth <= i_converted_number(3 downto 0);
--	i_onesth <= i_converted_number(7 downto 4);
--	i_ones  	<= i_converted_number(11 downto 8);
--	i_tens  	<= i_converted_number(15 downto 12);
--	i_test <= i_converted_number(1 downto 0);
end Behavioral;

