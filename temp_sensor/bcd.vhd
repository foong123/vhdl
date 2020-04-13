library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bcd is

	Port( input_number : in  std_logic_vector (11 downto 0);
			converted_number : out std_logic_vector (23 downto 0)
		);
end bcd;

architecture Behavioral of bcd is

signal i_converted_number : std_logic_vector (23 downto 0);
signal i_tensth, i_onesth : std_logic_vector (3 downto 0);

--for testing
--signal thous,huns,tens,ones,onesth,tensth: std_logic_vector (3 downto 0);
--signal converted_number_test : std_logic_vector (23 downto 0);

--Function for bin to bcd
function bin_to_bcd (bin_in : std_logic_vector(11 downto 0)) return std_logic_vector is

	-- temporary variable
	variable temp : STD_LOGIC_VECTOR (11 downto 0);
	-- variable to store the output BCD number
	variable bcd : std_logic_vector(23 downto 0) := (others => '0');

	begin
	-- zero the bcd variable
	bcd := (others => '0');
	
	-- read input into temp variable
    temp(11 downto 0) := bin_in;
	 
	for i in 1 to temp'Length loop
	
		--tensth
		if bcd(3 downto 0) >= 1 then --add 7 as number cannot be >= 1.
		
			bcd(3 downto 0) := bcd(3 downto 0) + 7;
			
		end if;

		--onesth
		if bcd(7 downto 4) >= 1 then --add 7 as number cannot be >= 1.
		
			bcd(7 downto 4) := bcd(7 downto 4) + 7;
			
		end if;

		--one
		if bcd(11 downto 8) > 4 then  --add 3 as number cannot be > 4.
		
			bcd(11 downto 8) := bcd(11 downto 8) + 3;
			
		end if;
		
		--tens
		if bcd(15 downto 12) > 4 then  --add 3 as number cannot be > 4.
		
			bcd(15 downto 12) := bcd(15 downto 12) + 3;
			
		end if;
		
		--huns
		if bcd(19 downto 16) > 4 then  --add 3 as number cannot be > 4.
		
			bcd(19 downto 16) := bcd(19 downto 16) + 3;
			
		end if;
		
		-- thousands can't be > 4 for 12-bit input number so don't need to do anything for thousands
		
		-- shift bcd left by 1 bit, copy MSB of temp into LSB of bcd
      bcd := bcd(22 downto 0) & temp(11);
		
		-- shift temp left by 1 bit
      temp := temp(10 downto 0) & '0';

	end loop;
	
	return bcd;
	
end bin_to_bcd;

begin

--Conversion using function
i_converted_number <= bin_to_bcd(input_number);

-- for the decimal place
-- tensth will only have 0 and 1 where 0 -> 0 and 1 -> 5
i_tensth <=  "11" & i_converted_number(1 downto 0);

-- rearrange oneth so that it become 0 -> 2 -> 5 -> 7 -> 0 repeat..
i_onesth <=  "11" & i_converted_number(0) & i_converted_number(4);

--Output
converted_number <= i_converted_number(23 downto 8) & i_onesth & i_tensth;

--for testing
--converted_number_test <= i_converted_number(23 downto 8) & i_onesth & i_tensth;
--thous <= converted_number_test(23 downto 20);
--huns <= converted_number_test(19 downto 16);
--tens <= converted_number_test(15 downto 12);
--ones <= converted_number_test(11 downto 8);
--onesth <= converted_number_test(7 downto 4);
--tensth <= converted_number_test(3 downto 0);

end Behavioral;