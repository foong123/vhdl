----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:46:59 10/26/2019 
-- Design Name: 
-- Module Name:    Rs232Txd - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Rs232Txd is

	port( Reset, Clock16x, Send: in std_logic;
			DataIn: in std_logic_vector (7 downto 0);
			Txd: out std_logic);
end Rs232Txd;

architecture Rs232Txd_Arch of Rs232Txd is

	attribute enum_encoding: string;
	
	--state definitions
	type stateType is (stIdle,stData,stTxdCompleted);
	attribute enum_encoding of stateType: type is "00 01 10";	-- removed stStop
	
	signal presState: stateType;
	signal nextState: stateType;
	signal iSend1, iSend2, iReset, iClock1xEnable, iEnableTxdBuffer, iEnableShift: std_logic;
	signal iTxdBuffer: std_logic_vector (8 downto 0) := (others => '1');
	signal iClockDiv: std_logic_vector (3 downto 0);
	signal iClock1x: std_logic;
	signal iNoBitsSent: std_logic_vector (3 downto 0);

begin

process (Clock16x)

begin

	if Clock16x'event and Clock16x = '1' then
	
		if Reset = '1' or iReset = '1' then
		
			iSend1 <= '1';
			iSend2 <= '1';
			iClock1xEnable <= '0';
			iClockDiv <= (others => '0');
			
			
		else
		
			iSend1 <= Send;
			iSend2 <= iSend1;
			
		end if;

		if iSend1 = '1' and iSend2 = '0' then
		
			iClock1xEnable <= '1';
			
		end if;

		if iClock1xEnable = '1' then
		
			iClockDiv <= iClockDiv + '1';
			
		end if;
		
	end if;
end process;

iClock1x <= iClockDiv(3);

process (iClock1xEnable, iClock1x)

begin

	if iClock1xEnable = '0' then
	
		iNoBitsSent <= (others=>'0');
		presState <= stIdle;
		
	elsif iClock1x'event and iClock1x = '1' then
	
		iNoBitsSent <= iNoBitsSent + '1';
		presState <= nextState;
		
	end if;		
	
	if iClock1x'event and iClock1x = '1' then
	
		if iEnableTxdBuffer = '1' then
		
			iTxdBuffer <= DataIn & '0'; -- inserting start bit 
			
		end if;	
		
		if iEnableShift = '1' then
		
			iTxdBuffer <= '1' & iTxdBuffer(8 downto 1);
			
		end if;
	end if;
	
end process;

Txd <= iTxdBuffer(0);

process (presState, iClock1xEnable, iNoBitsSent)
begin

	-- signal defaults
	iReset <= '0';
	iEnableTxdBuffer <= '0';
	iEnableShift <= '0';
	
	case presState is
	
		when stIdle =>
			if iClock1xEnable = '1' then
				iEnableTxdBuffer <= '1';
				nextState <= stData;
			else
				nextState <= stIdle;
			end if;
			
		when stData =>
			if iNoBitsSent = "1010" then
				nextState <= stTxdCompleted;
			else
				iEnableShift <= '1';
				nextState <= stData;
			end if;
				
		when stTxdCompleted =>
				iReset <= '1';
				nextState <= stIdle;
				
	end case;
	
end process;

end Rs232Txd_Arch;

