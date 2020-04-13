library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bcd is

	Port( DataIn : in  std_logic_vector (11 downto 0);
			Clock16x,Reset,Convert : in std_logic;
			Display : out std_logic;
			converted_number : out std_logic_vector (23 downto 0)
		);
end bcd;

architecture Behavioral of bcd is

	attribute enum_encoding : string;
	-- state definitions
	type stateType is (stIdle, stConvert, stDone);
	attribute enum_encoding of statetype : type is "00 01 11";

		--Internal signals
	signal presState, nextState : stateType;
	signal iReset,iClock1xEnable,iDisplay,iConvert1,iConvert2,iEnableDataOut: std_logic := '0';
	signal i_converted_number : std_logic_vector (15 downto 0):= (others => '0');
	signal iDataOut : std_logic_vector (23 downto 0):= (others => '0');
	signal i_decimal : std_logic_vector (7 downto 0):= (others => '0');
	--signal iConvert: std_logic := '0';
	--signal iNoBitsConverted : std_logic_vector (3 downto 0):= (others => '0');
	
	--for testing
	--signal thous,huns,tens,ones,onesth,tensth: std_logic_vector (3 downto 0);

	--Function for bin to bcd
	function bin_to_bcd (bin_in : std_logic_vector(9 downto 0)) return std_logic_vector is

		-- temporary variable
		variable temp : STD_LOGIC_VECTOR (9 downto 0);
		-- variable to store the output BCD number
		variable bcd : std_logic_vector(15 downto 0) := (others => '0');
		-- variable to store the output BCD number
	  -- organized as follows
	  -- thousands = bcd(15 downto 12)
	  -- hundreds = bcd(11 downto 8)
	  -- tens = bcd(7 downto 4)
	  -- ones = bcd(3 downto 0)

		begin
		-- zero the bcd variable
		bcd := (others => '0');
		
		-- read input into temp variable
		 temp(9 downto 0) := bin_in;
		-- cycle 10 times as 10 input bits
		-- need not to check and add 3 for the first 3 iterations as the number can never be > 4
		for i in 1 to temp'Length loop

			--one
			if bcd(3 downto 0) > 4 then  --add 3 as number cannot be > 4.
				bcd(3 downto 0) := bcd(3 downto 0) + 3;
			end if;
			
			--tens
			if bcd(7 downto 4) > 4 then  --add 3 as number cannot be > 4.
				bcd(7 downto 4) := bcd(7 downto 4) + 3;
			end if;
			
			--huns
			if bcd(11 downto 8) > 4 then  --add 3 as number cannot be > 4.
				bcd(11 downto 8) := bcd(11 downto 8) + 3;
			end if;
			
			-- thousands can't be > 4 for 12-bit input number so don't need to do anything for thousands	
			-- shift bcd left by 1 bit, copy MSB of temp into LSB of bcd
			bcd := bcd(14 downto 0) & temp(9);
			
			-- shift temp left by 1 bit
			temp := temp(8 downto 0) & '0';

		end loop;
		return bcd;
	end bin_to_bcd;

begin

process(Clock16x)
-- temporary variable
-- variable to store the output BCD number
--variable bcd : std_logic_vector(15 downto 0) := (others => '0');
--variable temp : STD_LOGIC_VECTOR (9 downto 0);
begin
	
	if Clock16x'event and Clock16x = '1' then
		if Reset = '1' OR iReset = '1' then 
			iClock1xEnable <= '0';
			iConvert1 <= '1';
			iConvert2 <= '1';
			--iNoBitsConverted <= (others => '0');
			
		else
			iConvert1 <= Convert;
			iConvert2 <= iConvert1;
		end if;

		if iConvert1 = '1' and iConvert2 = '0' then
			iClock1xEnable <= '1';
			-- zero the bcd variable
			--bcd := (others => '0');
			--temp(9 downto 0) := DataIn(11 downto 2);
		end if;
		
		if iClock1xEnable = '1' then 
			presState <= nextState;
--			if iConvert = '1' then 
--				iNoBitsConverted <= iNoBitsConverted + '1';
--				if iNoBitsConverted /= "1010" then 
--					--one
--					if bcd(3 downto 0) > 4 then  --add 3 as number cannot be > 4.
--						bcd(3 downto 0) := bcd(3 downto 0) + 3;
--					end if;
--					
--					--tens
--					if bcd(7 downto 4) > 4 then  --add 3 as number cannot be > 4.
--						bcd(7 downto 4) := bcd(7 downto 4) + 3;
--					end if;
--					
--					--huns
--					if bcd(11 downto 8) > 4 then  --add 3 as number cannot be > 4.
--						bcd(11 downto 8) := bcd(11 downto 8) + 3;
--					end if;
--					-- thousands can't be > 4 for 12-bit input number so don't need to do anything for thousands
--					-- shift bcd left by 1 bit, copy MSB of temp into LSB of bcd
--					bcd := bcd(14 downto 0) & temp(9);
--					-- shift temp left by 1 bit
--					temp := temp(8 downto 0) & '0';					
--				end if;
--					i_converted_number <= bcd;
--			end if;

			if iEnableDataOut = '1' then 
				iDisplay <= '1';
				iDataOut <= i_converted_number & i_decimal;
			else
				iDisplay <= '0';
			end if;
		end if;
	end if;
end process;

Display <= iDisplay;
--Output
converted_number <= iDataOut;

process(presState,iClock1xEnable,DataIn)
begin

	-- signal defaults
	iReset <= '0';
	case presState is
		when stIdle =>
				if iClock1xEnable = '1' then
					nextState <= stConvert;
				else
					nextState <= stIdle;
				end if;
				
		when stConvert =>
				i_converted_number <= bin_to_bcd(DataIn(11 downto 2));
				iEnableDataOut <= '1';
				nextState <= stDone;
--				if iNoBitsConverted = "1010" then 
--					iEnableDataOut <= '1';
--					iConvert <= '0';
--					nextState <= stDone;
--				else
--					iConvert <= '1';
--					nextState <= stConvert;
--				end if;
		when stDone =>
				iReset <= '1';
				iEnableDataOut <= '0';
				nextState <= stIdle;
	end case;
	
	-- Decimal handling
	case DataIn(1 downto 0) is
		when "00" => i_decimal <= "00000000";
		when "01" => i_decimal <= "00100101";
		when "10" => i_decimal <= "01010000";
		when "11" => i_decimal <= "01110101";
		when others => i_decimal <= "00000000";
	end case;
		
end process;

--with i_converted_number(7 downto 0) select
--
--	i_decimal <= "00000000" when "00000000",		--0.00
--	"00100101" when "00000001",						--0.25
--	"01010000" when "00010000",						--0.50
--	"01110101" when "00010001",						--0.75		
--	"00000000" when others;

--for testing
--thous <= iDataOut(23 downto 20);
--huns <= iDataOut(19 downto 16);
--tens <= iDataOut(15 downto 12);
--ones <= iDataOut(11 downto 8);
--onesth <= iDataOut(7 downto 4);
--tensth <= iDataOut(3 downto 0);

end Behavioral;