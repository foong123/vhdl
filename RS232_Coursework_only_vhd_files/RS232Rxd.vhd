library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;


entity Rs232Rxd is

	port( Reset, Clock16x, Rxd: in std_logic;
			DataOut1, DataOut2: out std_logic_vector (7 downto 0));
			
end Rs232Rxd;


architecture Rs232Rxd_Arch of Rs232Rxd is

	attribute enum_encoding: string;
-- state definitions

		type stateType is (stIdle, stData, stRxdCompleted);
		attribute enum_encoding of statetype: type is "00 01 10"; -- removed stStop
		
			signal presState: stateType;
			signal nextState: stateType;
			signal iReset, iRxd1, iRxd2, iClock1xEnable : std_logic ;
			signal iClock1x : std_logic := '1';
			signal iEnableDataOut: std_logic ;
			signal iClockDiv: std_logic_vector (3 downto 0) := "1010";
			signal iDataOut1, iDataOut2: std_logic_vector (7 downto 0) :="00000000";
			signal iShiftRegister: std_logic_vector (7 downto 0) :=(others=>'0');
			signal iNoBitsReceived: std_logic_vector (3 downto 0) :=(others=>'0') ;
			
begin

 process (Clock16x)
 
 begin

	if Clock16x'event and Clock16x = '1' then
	
	if Reset = '1' or iReset = '1' then
		iRxd1 <= '1';
		iRxd2 <= '1';
		iClock1xEnable <= '0';
		iClockDiv <= (others => '0');
		
	else
		iRxd1 <= Rxd;
		iRxd2 <= iRxd1;
		
	end if;
	
	if iRxd1 = '0' and iRxd2 = '1' then
		iClock1xEnable <= '1';
		
	elsif iClock1xEnable = '1' then
		iClockDiv <= iClockDiv + '1';
		
	iClock1x <= iClockDiv(3);
	
	end if;
	
	end if; 
	
 end process;

 process (iClock1xEnable, iClock1x, Reset)
 begin
	if iClock1xEnable = '0' then
		iNoBitsReceived <= (others=>'0');
		presState <= stIdle;
		
	elsif iClock1x'event and iClock1x = '1' then
		iNoBitsReceived <= iNoBitsReceived + '1';
		presState <= nextState;
		
	end if;
	
	if iClock1x'event and iClock1x = '1' then
	
		if iEnableDataOut = '1' then
			iDataOut2 <= iDataOut1;
			iDataOut1 <= iShiftRegister;
			
		else
			iShiftRegister <= Rxd & iShiftRegister(7 downto 1);
			
		end if;
	
	end if;
	
	if Reset = '1' then 
		
		iDataOut1 <= (others=>'0');
		iDataOut2 <= (others=>'0');
		presState <= stIdle;
	
	end if;
	
 end process;
 
DataOut1 <= iDataOut1;
DataOut2 <= iDataOut2;
	
 process (presState, iClock1xEnable, iNoBitsReceived)
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
			if iNoBitsReceived = "1010" then
				iEnableDataOut <= '1';
				nextState <= stRxdCompleted;

			else
				iEnableDataOut <= '0';
				nextState <= stData;
			end if;
				
		when stRxdCompleted =>
				iReset <= '1';
				nextState <= stIdle;

	end case; 
	
 end process;
 
end Rs232Rxd_Arch; 