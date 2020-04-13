library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SPI is

PORT( Clock, MISO, Reset: in std_logic;
		SCLK, CS,Convert: out std_logic;
		DataOut : out std_logic_vector (11 downto 0));
			
end SPI;

architecture Behavioral of SPI is

attribute enum_encoding : string;
	
	-- state definitions
	type stateType is (stIdle, stData, stStop);
	attribute enum_encoding of statetype : type is "00 01 11";
	
	--Internal signals
	signal presState, nextState : stateType;
	signal iReset,iClock1xEnable,iEnableDataOut,iSCLK,iConvert: std_logic := '0';
	signal iClockDiv : std_logic_vector (23 downto 0) := (others => '0');
	signal iSCLKDiv : std_logic_vector (3 downto 0) := (others => '0');
	signal iShiftRegister : std_logic_vector (15 downto 0) := (others => '0');
	signal iDataOut : std_logic_vector (11 downto 0) := (others => '0');
	signal iNoBitsReceived : std_logic_vector (5 downto 0) := (others => '0');
begin

process(Clock)
begin 
	
	if Clock'event and Clock = '1' then
		if Reset = '1' OR iReset = '1' then 
			iClock1xEnable <= '0';
			iClockDiv <= (others => '0');
			iSCLKDiv <= "0010";
		else
			iClockDiv <= iClockDiv + '1';
			CS <= '1';
		end if;
		
		if iClockDiv >= "111110111100010100100000" then		--16500000 counts or approx 0.33s
			-- clock divider for SCLK
			iClock1xEnable <= '1';
			CS <= '0';
			if iSCLKDiv = "1101" then
				iSCLKDiv <= "0010";		-- reset clock
			else
				iSCLKDiv <= iSCLKDiv + '1';
			end if;
			iSCLK <= iSCLKDiv(3);
		end if;		
	end if;
end process;

--SCLK is 4.16MHz
SCLK <= iSCLK;

process (iClock1xEnable, iSCLK)
begin
	
	if iClock1xEnable = '0' then
	
		iNoBitsReceived <= (others => '0');
		presState <= stIdle;
		iConvert <= '0';

	else
	
		if iSCLK'event and iSCLK = '0' then
		
		--Start writing the data
		iNoBitsReceived <= iNoBitsReceived + '1';	--Begin count the number of data readed
		presState <= nextState;
		
			if iEnableDataOut = '1' then 
			
				iConvert <= '1';
				iDataOut <= iShiftRegister(14 downto 3);
				
			else 
				--write the data 
				iShiftRegister <= iShiftRegister(14 downto 0) & MISO;

			end if;
		end if;
	end if;

end process;

DataOut <= iDataOut;
Convert <= iConvert;
		
process (presState,iClock1xEnable,iNoBitsReceived)
begin

	-- signal defaults
	iReset <= '0';
	iEnableDataOut <= '0';
	case presState is 
		when stIdle =>
				if iClock1xEnable = '1' then

					nextState <= stData;
					
				else
				
					nextState <= stIdle;
							
				end if;
		when stData =>
				--Once written 16 bits then stop 	
				if iNoBitsReceived = "10000" then 
				
					iEnableDataOut <= '1';
					nextState <= stStop;
				
				else 
					--Continue writing
					iEnableDataOut <= '0';
					nextState <= stData;	
					
				end if;
		when stStop =>
			--Reset the clock using internal reset 
			nextState <= stIdle;
			iReset <= '1';
	
	end case;
end process;

end Behavioral;