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
		SCLK, CS,Send: out std_logic;
		DataOut : out std_logic_vector (15 downto 0));
			
end SPI;

architecture Behavioral of SPI is

attribute enum_encoding : string;
	
	-- state definitions
	type stateType is (stIdle, stData, stStop);
	attribute enum_encoding of statetype : type is "00 01 11";
	
	--Internal signals
	signal presState, nextState : stateType;
	signal iReset,iClock1xEnable,iEnableDataOut,iSend,iSCLK: std_logic := '0';
	signal iClockDiv : std_logic_vector (23 downto 0) := (others => '0');
	signal iShiftRegister,iDataOut1 : std_logic_vector (15 downto 0) := (others => '0');
	signal iNoBitsReceived : std_logic_vector (5 downto 0) := (others => '0');

begin

process(Clock)
begin 
	
	if Clock'event and Clock = '1' then
		if Reset = '1' OR iReset = '1' then 
			
			iClock1xEnable <= '0';
			iClockDiv <= (others => '0');
			
		else
		
			iClockDiv <= iClockDiv + '1';
		
		end if;
		
		if iClockDiv >= "111110111100010100100000" then		--16500000 counts or approx 0.33s
		
			-- clock divider for SCLK
			iClock1xEnable <= '1';
			iSCLK <= iClockDiv(3);
			
		end if;		
	end if;
end process;

--SCLK is 3.125MHz
SCLK <= iSCLK;

process (iClock1xEnable, iSCLK)
begin
	
	if iClock1xEnable = '0' then
	
		CS <= '1';
		iNoBitsReceived <= (others => '0');
		presState <= stIdle;

	elsif iSCLK'event and iSCLK = '0' then
		
		--Start writing the data
		CS <= '0';
		iNoBitsReceived <= iNoBitsReceived + '1';	--Begin count the number of data readed
		presState <= nextState;
		
		if iEnableDataOut = '1' then

			iDataOut1 <= iShiftRegister;

		else
		
			--write the data 
			iShiftRegister <= iShiftRegister(14 downto 0) & MISO;

		end if;
	end if;

end process;
	
Send <= iSend;		--For Rxd to trigger a send
DataOut <= iDataOut1;	--Output
		
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
					iSend <= '0';
					
				end if;
		when stData =>
				--Once written 16 bits then stop 	
				if iNoBitsReceived = "10000" then 
				
					iEnableDataOut <= '1';
					nextState <= stStop;
					iSend <= '1';
				
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